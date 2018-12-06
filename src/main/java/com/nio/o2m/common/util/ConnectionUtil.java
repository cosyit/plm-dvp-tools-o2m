package com.nio.o2m.common.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnectionUtil {

    //为了事务控制，保证多并发时候，是同一个连接。线程隔离，用于事物的控制。
    private static ThreadLocal<Connection> connectionThreadLocal = new ThreadLocal<>();

    public static Connection getConnection() {

        //先从缓存Map中拿。利用当前的线程作为key，去拿值，值为Conn
        Connection conn = connectionThreadLocal.get();

        if (conn == null) {
            try {
                //没有连接，创建连接。
                OracleDruidDataSourceSingleton dataSource= OracleDruidDataSourceSingleton.getInstance();
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
     * @param st
     * @param rs
     */
    public static void release( Statement st, ResultSet rs) {
        Connection conn =  connectionThreadLocal.get();
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }finally {
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

}
