package com.nio.o2m.core;

import com.nio.o2m.common.util.MySQLConnectionUtil;
import com.nio.o2m.common.util.OracleConnectionUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class QueryUtil {
    public static void main(String[] args) {
        long start = System.currentTimeMillis();
        //前提：第零步：请在mysql 库中，按照oracle库的表结构，把表结构构造出来。
        Map<String, Map<String, Object>> dataBaseInfo = getDataBaseInfo();// 第一步：获取元数据的各个信息 并打包。
        long end = System.currentTimeMillis();
        System.out.println("用时" + (end - start));
    }


    /**
     * 单表粒度的转换
     *
     * @param tableName
     * @param selectAllFieldsSQL
     * @param fields
     */
    public static void o2mTransferRunner(String tableName, String selectAllFieldsSQL, ArrayList<String> fields, String mysqlInsertSqlItem) {
        // 而已同一个连接可以搞定这些事情。使用多线程，用不同连接也可以搞定这些事情。所以传递一个链接对象进来。可以支持多线程。
        Connection connection = OracleConnectionUtil.getOracleConnection();

        PreparedStatement ps = null;
        ResultSet rs = null;

        //用来装查询的数据。
        List<List<String>> tableList = new ArrayList<>();

        try {
            ps = connection.prepareStatement(selectAllFieldsSQL);

            rs = ps.executeQuery();

            //设置一个做批量的计算器。
            int i = 0;
            while (rs.next()) {
                //一行上的结果
                List<String> rowMinList = new ArrayList<>();
                for (String field : fields) {
                    String fieldValue = rs.getString(field);//fields 还要抽出来，否则无法在这里对应。
                    rowMinList.add(fieldValue);
                }
                tableList.add(rowMinList);
                i++;//一行遍历结束后，把计数器自增+1

                if (i % 1000 == 0) {
                    //执行批量。
                    executeManySql(tableList, tableName, mysqlInsertSqlItem);
                    //清空内存
                    tableList.removeAll(tableList); //移除包含在此集合的元素。

                    System.out.println(i); //查看当前计数器的值。
                }
            }

            executeManySql(tableList, tableName, mysqlInsertSqlItem); // 最后一次未被整除的。
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void executeManySql(List<List<String>> tableList, String tableName, String mysqlInsertSqlItem) {
        Connection mySQLConnection = MySQLConnectionUtil.getMySQLConnection();
        // System.out.println("===============>"+mySQLConnection);

        try {

            mySQLConnection.setAutoCommit(false);

            PreparedStatement ps;

            //todo insert into sql 可以在第一次的时候，就构造出来。

            ps = mySQLConnection.prepareStatement(mysqlInsertSqlItem);

            for (List<String> rowValueList : tableList) {
                for (int i = 0; i < rowValueList.size(); i++) {
                    ps.setObject(i + 1, rowValueList.get(i));
                }

                //先累积起来。
                ps.addBatch();
            }

            //遍历循环完了，积累完了。执行批量更新。
            ps.executeBatch();

            //
            mySQLConnection.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MySQLConnectionUtil.closeConnectionWhenHasTransactionOpration();
        }
    }

    /**
     * 1.拿到个表的查询语句。打包。
     *
     * @return 返回数据的大体结构  之     我的构想。
     * table1 ------ >    queryAllInfoSql :  " select * from tableName"   1:1 一个表 一条sql.
     * tableFields   :  " field1,field2,field3....."   1:1 ArrayList
     * <p>
     * table2 ------ >    queryAllInfoSql :  " select * from tableName"   1:1 一个表 一条sql.
     * tableFields   :  " field1,field2,field3....."   1:1 ArrayList
     */

    private static Map<String, Map<String, Object>> getDataBaseInfo() {
        /**遍历元数据时候，我们可以拿到很多信息：
         * 1.可推理出Oracle的查询语句。
         * 2.每张表包含哪些字段的字段集合，因为在后面解包的时候会要每个字段的上的对应的值。
         * [3.可以得到 mysql 的创建语句[因为时间不够做类型判断，防止bug耽误时间暂时不做]
         */

        //0.根据返回值，先定义出返回的数据集合容器--- 全局数据库各项数据  结构体容器。
        Map<String, Map<String, Object>> databaseInfo = new HashMap<>();

        //1.开始正式进入我们的逻辑了。首先我们得到conn链接对象，进而获取metaData.
        Connection connection = OracleConnectionUtil.getOracleConnection();
        try {
            DatabaseMetaData metaData = connection.getMetaData(); //由connection获取到的元数据对象。

            ResultSet resultSetOfTables = null;

            //得到库下面所有表的结果集 -- 由此可以得到每个表名。因为每个库存在差别的，所以先看运行时链接的是哪个库。
            if ("MySQL".equalsIgnoreCase(metaData.getDatabaseProductName())) {
                resultSetOfTables = metaData.getTables(connection.getCatalog(), "root", null, new String[]{"TABLE"});
            } else if ("Oracle".equalsIgnoreCase(metaData.getDatabaseProductName())) {
                resultSetOfTables = metaData.getTables("DXADMIN", "DXADMIN", null, new String[]{"TABLE"}); //oracle
            }

            //子结构 --- 关于每张表的结构体。
            Map<String, Object> tableInfoItem = new HashMap<>();  // n 个 [tableName === oracleQuerySql]
            while (resultSetOfTables.next()) {


                //循环表的时候，得到表名
                String tableName = resultSetOfTables.getString("TABLE_NAME");

                ResultSet resultSetColumns = null;
                if ("MySQL".equalsIgnoreCase(metaData.getDatabaseProductName())) {
                    resultSetColumns = metaData.getColumns(connection.getCatalog(), "root", tableName, "%");
                } else if ("Oracle".equalsIgnoreCase(metaData.getDatabaseProductName())) {
                    resultSetColumns = metaData.getColumns("DXADMIN", "DXADMIN", tableName, "%"); //oracle
                }

                //StringBuffer 拼接器 来拼接oracle查询语句。
                StringBuffer oracleQuerySqlItem = new StringBuffer();
                // 日志：开始拼接
                oracleQuerySqlItem.append("select ");

                //开始进行 mysql 中的插入语句的拼接。
                StringBuffer mysqlInsertSqlItem = new StringBuffer();
                mysqlInsertSqlItem.append("insert into " + tableName + " values (");

                //因为我不知道，哪一个next()是最后一个next,因为在最后一个next的后面要特殊处理，不拼接 ","
                StringBuffer fieldsStringBuffer = new StringBuffer();
                StringBuffer fieldsStringBufferPsCron = new StringBuffer();

                //在单表域中，进行循环可得到字段集。
                ArrayList<String> fieldsItem = new ArrayList<>();


                while (resultSetColumns.next()) {
                    //拿到表中的字段后，做2件事情，1，装到fields项 中。 2.同事拼接到查询sql.
                    String column_name = resultSetColumns.getString("column_name");
                    fieldsItem.add(column_name);
                    //把每个字段的
                    fieldsStringBuffer.append(column_name).append(",");
                    fieldsStringBufferPsCron.append("?,");
                }

                oracleQuerySqlItem.append(fieldsStringBuffer.subSequence(0, fieldsStringBuffer.lastIndexOf(","))); //  fieldsStringBuffer.subSequence(0,fieldsStringBuffer.lastIndexOf(","));   效果如下 a,b,c,   ---> a,b,c

                mysqlInsertSqlItem.append(fieldsStringBufferPsCron.subSequence(0, fieldsStringBufferPsCron.lastIndexOf(","))).append(")");

                oracleQuerySqlItem.append(" from " + tableName);
                //System.out.println(oracleQuerySqlItem); //打印 Oracle查询sql 项。

                //sql 拼装完成。把这个table的信息总结一下。   日志：tableInfo总结完成，各项数据全部组装完成。装入结构体容器。
                tableInfoItem.put("tableQuerySQL_FromOracle", oracleQuerySqlItem.toString());  // 目前通过metaData只封装了查询Oracle 数据库的一些表查询语句。
                tableInfoItem.put("fields", fieldsItem);  // 目前通过metaData只封装了查询Oracle 数据库的一些表查询语句。
                tableInfoItem.put("mysqlInsertSqlItem", mysqlInsertSqlItem.toString());  // 构造出查询语句，方便解析。 fixme : 还可以放其他有用的项。

                //日志：上面的子Map包装成功。现在就开始把子结构体。装到
                databaseInfo.put(tableName, tableInfoItem); //根据这个sql将来可以查询到所有表的各项数据的ResultSet.


                System.out.println("[" + tableName + "]↓");
                System.out.println(oracleQuerySqlItem.toString());
                System.out.println(mysqlInsertSqlItem.toString());
                System.out.println();


                o2mTransferRunner(tableName, oracleQuerySqlItem.toString(), fieldsItem, mysqlInsertSqlItem.toString());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            OracleConnectionUtil.release(null, null);
        }
        return databaseInfo;
    }
}
