package com.nio.o2m.common.util;

import java.lang.reflect.Field;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MySQLConnectionUtil {

    //为了事务控制，保证多并发时候，是同一个连接。线程隔离，用于事物的控制。
    private static ThreadLocal<Connection> connectionThreadLocal = new ThreadLocal<>();

    public static Connection getMySQLConnection() {

        //先从缓存Map中拿。利用当前的线程作为key，去拿值，值为Conn
        Connection conn = connectionThreadLocal.get();

        if (conn == null) {
            try {
                //没有连接，创建连接。
                MySQLDruidDataSourceSingleton dataSource = MySQLDruidDataSourceSingleton.getInstance();
                conn = dataSource.getConnection();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                connectionThreadLocal.set(conn);
            }
        }
        return conn;
    }


    /**
     * 使用Druid连接池时候的资源释放
     *
     * @param st
     * @param rs
     */
    public static void release(Statement st, ResultSet rs) {
        Connection conn = connectionThreadLocal.get();
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                connectionThreadLocal.remove();
            }
        }
        if (st != null) {
            try {
                st.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    /**
     * 以下几个方法是都是一些和Druid连接池无关的方法。可单独使用。
     */


    public static void closeConnectionWhenHasTransactionOpration() {

        Connection con = connectionThreadLocal.get();
        try {
            if (con != null && !con.isClosed()) {
                con.close();
//  				关闭连接后，把tl从ThreadLocal中移走。
                connectionThreadLocal.remove();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    //1 开启事务
    public static void beginTransaction(Connection con) {
        if (con != null) {
            try {
                con.setAutoCommit(false);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    //2.发一条sql 然后提交事务
    public static void commit(Connection con) {
        if (con != null) {
            try {
                con.commit();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    //3. 如果sql没有执行成功，出了问题，就要回滚事务
    public static void rollback(Connection con) {
        if (con != null) {
            try {
                con.rollback();
                con.setAutoCommit(true);
            } catch (SQLException e) {
                // TODO: handle exception
                e.printStackTrace();
            }
        }
    }


    //4.如果没有出问题，自动提交后，那么就关闭事务
    public static void closeTransaction(Connection con) {
        if (con != null) {
            try {
                con.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    /**
     * 编写update方法。
     */
    public static void update(String sql, Object... args) {

        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = getMySQLConnection();
            ps = con.prepareStatement(sql);
            for (int i = 0; i < args.length; i++) {
                ps.setObject(i + 1, args[i]);
            }
            int successfullyCount = ps.executeUpdate();
            System.out.println(successfullyCount + "条记录执行成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 编写通用的查询方法 并用来返回实体。
     * <T>声明泛型
     */
    public static <T> T readGetSingleObject(Class<T> clazz, String sql, Object... args) {

        //T是用来泛指一些类型，泛型只是指代，初始化泛型就是把泛型用实际类型替代。
        //所以是没法去进行实例化的，只能编译阶段引用可以，但是不能在运行阶段使用。
        T entity = null;

        Connection con = getMySQLConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            for (int i = 0; i < args.length; i++) {
                ps.setObject(i + 1, args[i]);
            }
            rs = ps.executeQuery();
            // 1.得到ResultSetMetaData接口  的对象。
            ResultSetMetaData rsmd = rs.getMetaData();
            //获得它有多少个列。
            int i_columnCount = rsmd.getColumnCount();

            if (rs.next()) {
                //创建一个对象（类型map）,去存储相关的k/v数据。
                entity = clazz.newInstance();

                //rs.getObject()-->注入到对象属性中。一个一个的为对象的属性赋值[初始化]。
                //现在仅仅靠clazz 知道了对象是哪个类型的,这个是java虚拟机范围知道  。
                //但是clazz没法让我们知道查询哪些随机的个别属性，这个是数据库知道。
                //但是数据库只知道你查询哪些数据库中的字段列，但是jvm中的列可以是另外一种
                //数据了，所以我们需要一个桥。就是列名。通过as来定义。
                // `columnName` as javaBeanField

                Map<String, Object> map = new HashMap<String, Object>();//这个容器用对象代替不是一样么。
                entity = clazz.newInstance();

                // 2.打印每一列的列名
                for (int i = 0; i < i_columnCount; i++) {
                    //和ps中的通配符一样，列别名的索引也是从1开始。。 拿到查询的列名。
                    String DBLabelAsJavaField = rsmd.getColumnLabel(i + 1);//通过别名连接过了.
                    //通过rs对象，获取查询到的列名上的值。
                    Object fieldDataInDB = rs.getObject(DBLabelAsJavaField);

                    map.put(DBLabelAsJavaField, fieldDataInDB);
                    //用反射赋值不就可以了吗？
                    Field f = clazz.getDeclaredField(DBLabelAsJavaField);
                    //都是private的字段。
                    f.setAccessible(true);
                    f.set(entity, fieldDataInDB);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(rs, ps, con);
        }

        return entity;
    }


    public static Map queryByAllFieldsSQL( String sql, Object... args) {

        Connection con = getMySQLConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = con.prepareStatement(sql);
            for (int i = 0; i < args.length; i++) {
                ps.setObject(i + 1, args[i]);
            }

            rs = ps.executeQuery();

    /*

            while (rs.next()){
                rs.getString()
            }
     */



        } catch (Exception e) {
            e.printStackTrace();
        }
            return null;
    }


    /**
     * 关闭连接的方法：注意关闭顺序即可。
     * Logger.getLogger(MyJDBCTools.class.getName()).log(Level.SEVERE,null,e);
     * 这种代码其实还是可以进行方法提取的。
     */

    public static void closeConnection(ResultSet rs, PreparedStatement ps, Connection con) {
        //rs.isClosed在if()中，需要抛异常。rs.close()在 if {}
        //也要抛出异常，对于这种情况，不如有一个大大的try catch将他们包起来。
        try {
            if (rs != null && !rs.isClosed()) rs.close();
        } catch (Exception e) {
            Logger.getLogger(MySQLConnectionUtil.class.getName()).log(Level.SEVERE, null, e);
        }

        try {
            if (ps != null && !ps.isClosed()) ps.close();
        } catch (Exception e) {
            Logger.getLogger(MySQLConnectionUtil.class.getName()).log(Level.SEVERE, null, e);
        }

        try {
            if (con != null && !con.isClosed()) con.close();
        } catch (Exception e) {
            Logger.getLogger(MySQLConnectionUtil.class.getName()).log(Level.SEVERE, null, e);
        }
    }


    /**
     * 添加我个人爱玩的一种方式。把查询的结果集rs，封装为一个map对象。
     */

}
