package com.nio.o2m.core;

import com.nio.o2m.common.util.ConnectionUtil;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class QueryUtil {
    public static void main(String[] args) {
        /**
         打包 select f1,f2,f3... from tableName  --- >返回的是一个ResultSet，把这个结果集的数据，打包。
         *
         */

        // 参数就是 selectAllFieldSQL fixme:参数一
        String selectAllFieldsSQL = "select COMPANY_ID,COMPANY_NAME,COMPANY_SHORT_NAME,COMPANY_IS_ACTIVE,COMPANY_CREATE_DATE,COMPANY_DEFAULT_SITE,COMPANY_CODE,COMPANY_TYPE,COMPANY_GROUP from DX_COMPANY_TEMP";

        // fixme : 参数2
        // 而已同一个连接可以搞定这些事情。使用多线程，用不同连接也可以搞定这些事情。所以传递一个链接对象进来。可以支持多线程。
        Connection connection = ConnectionUtil.getConnection();

        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = connection.prepareStatement(selectAllFieldsSQL);

           rs = ps.executeQuery();

           while (rs.next()){
               rs.getObject("");//fields 还要抽出来，否则无法在这里对应。
           }

        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    /**
     * 拿到个表的查询语句。打包。
     *
     * @return
     */
    private static Map<String, Map<String, String>> getDataBaseInfo() {
        //遍历元数据时候，我们可以拿到很多信息：1.得到查询语句。 2.可以得到 mysql 的创建语句。 3.
        Map<String, Map<String, String>> databaseInfo = new HashMap<>(); //全局数据库各项数据  结构体容器

        Connection connection = ConnectionUtil.getConnection();

        try {

            /**
             * 第一个是数据库名称，对于MySQL，则对应相应的数据库，对于Oracle来说，则是对应相应的数据库实例，可以不填，也可以直接使用Connection的实例对象中的getCatalog()方法返回的值填充；
             * 第二个是模式，可以理解为数据库的登录名，而对于Oracle也可以理解成对该数据库操作的所有者的登录名。对于Oracle要特别注意，其登陆名必须是大写，不然的话是无法获取到相应的数据，而MySQL则不做强制要求。
             * 第三个是表名称，一般情况下如果要获取所有的表的话，可以直接设置为null，如果设置为特定的表名称，则返回该表的具体信息。
             * 第四个是类型标准,以数组形式传值，有"TABLE"、"VIEW"、"SYSTEM TABLE"、"GLOBAL TEMPORARY"、"LOCAL TEMPORARY"、"ALIAS" 和 "SYNONYM"这几个经典的类型，
             * 一般使用”TABLE”，即获取所有类型为TABLE的表
             * 它返回一个ResultSet对象，有10列，详细的显示了表的类型：
             * TABLE_CAT String => 表类别（可为 null）
             *
             * TABLE_SCHEM String => 表模式（可为 null）
             *
             * TABLE_NAME String => 表名称
             *
             * TABLE_TYPE String => 表类型。
             *
             * REMARKS String => 表的解释性注释
             *
             * TYPE_CAT String => 类型的类别（可为 null）
             *
             * TYPE_SCHEM String => 类型模式（可为 null）
             *
             * TYPE_NAME String => 类型名称（可为 null）   --- 我想要的就是这个。
             *
             * SELF_REFERENCING_COL_NAME String => 有类型表的指定 "identifier" 列的名称（可为 null）
             *
             * REF_GENERATION String
             *
             * 可根据需要使用
             */
            DatabaseMetaData metaData = connection.getMetaData(); //由connection获取到的元数据对象。

            //得到库下面所有表的结果集
            ResultSet resultSetOfTables = metaData.getTables("DXADMIN", "DXADMIN", null, new String[]{"TABLE"});

            //int i = 0;

            /**
             * 我来思考一下，我的想法。
             * 我为什么建立一个map,我希望能保存信息的结构体
             *   表名 <--k/v--> 1. fields:  表字段集合
             *                  2.oracleSelectSql : ""
             *                  3.mysqlCreateSql : ""  --  两边数据库的字段类型判断太复杂，时间周期长，废弃改方案。
             *                  ...
             *                  x:目前只能想到这些了。
             */

            Map<String, String> tableInfoItem = new HashMap<>();  // n 个 [tableName === oracleQuerySql]
            while (resultSetOfTables.next()) {
                //表名
                String tableName = resultSetOfTables.getString("table_name");
                ResultSet resultSetColumns = metaData.getColumns("DXADMIN", "DXADMIN", tableName, "%");

                //StringBuffer 拼接器 来拼接oracle查询语句。
                StringBuffer oracleQuerySqlItem = new StringBuffer();
                // 日志：开始拼接
                oracleQuerySqlItem.append("select ");

                //因为我不知道，哪一个next()是最后一个next,因为在最后一个next的后面要特殊处理，不拼接 ","
                StringBuffer fields = new StringBuffer();
                while (resultSetColumns.next()) {
                    String column_name = resultSetColumns.getString("column_name");
                    fields.append(column_name).append(",");
                }

                oracleQuerySqlItem.append(fields.subSequence(0, fields.lastIndexOf(","))); //  fields.subSequence(0,fields.lastIndexOf(","));   效果如下 a,b,c,   ---> a,b,c

                oracleQuerySqlItem.append(" from " + tableName);
                //System.out.println(oracleQuerySqlItem); //打印 Oracle查询sql 项。

                //日志：sql拼接完成，装入 tableInfoItem 结构体容器。
                tableInfoItem.put(tableName, oracleQuerySqlItem.toString()); //根据这个sql将来可以查询到所有表的各项数据的ResultSet.

                //我把这个table的信息总结一下。   日志：tableInfo总结完成，各项数据全部组装完成。装入结构体容器。
                databaseInfo.put("tableQuerySQL_FromOracle", tableInfoItem);  // 目前通过metaData只封装了查询Oracle 数据库的一些表查询语句。 fixme : 还可以放其他有用的项。
            }
        } catch (SQLException e) {
            System.out.println("异常了。"); //todo delete
            e.printStackTrace();
        } finally {
            ConnectionUtil.release(null, null);
        }
        return databaseInfo;
    }
}
