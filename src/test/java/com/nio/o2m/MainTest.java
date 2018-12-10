package com.nio.o2m;

import com.alibaba.druid.pool.DruidDataSource;
import com.nio.o2m.common.enums.DataBaseInfoEnum;
import com.nio.o2m.common.util.OracleConnectionUtil;
import com.nio.o2m.common.util.ReadPropertiesFileUtil;
import org.junit.Test;

import java.sql.Connection;
import java.sql.SQLException;

//import com.nio.o2m.common.util.ReadPropertiesFileUtil;

public class MainTest {

    @Test
 public void testReadPropertiesFile() {
      String username = ReadPropertiesFileUtil.getValueInPropertiesFilesByKey("from.properties", "username");
        System.out.println(username);
    }


    //这里仅仅是测试，将来我们肯定用单例来获取连接池。
    @Test //Method() should be void
    public  void getConn() throws SQLException {

        Connection connection = null;
        DruidDataSource dataSource = new DruidDataSource();

        System.out.println(DataBaseInfoEnum.FROM_USERNAME.getInfo());
        System.out.println(DataBaseInfoEnum.FROM_PASSWORD.getInfo());
        System.out.println(DataBaseInfoEnum.FROM_DRIVERCLASS.getInfo());
        System.out.println(DataBaseInfoEnum.FROM_JDBCURL.getInfo());
        dataSource.setUsername(DataBaseInfoEnum.FROM_USERNAME.getInfo());
        dataSource.setPassword(DataBaseInfoEnum.FROM_PASSWORD.getInfo());
        dataSource.setDriverClassName(DataBaseInfoEnum.FROM_DRIVERCLASS.getInfo());
        dataSource.setUrl(DataBaseInfoEnum.FROM_JDBCURL.getInfo());
        System.out.println("--------------");
        System.out.println(DataBaseInfoEnum.TO_JDBCURL.getInfo());
        try {
            connection =  dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println(connection);//有可能为null所以IDEA中才有下划线？

        System.out.println(connection.getMetaData().getCatalogs());
        //connection.getMetaData().getColumns();

    }

    @Test
    public void testConnectionUtil(){
        System.out.println( OracleConnectionUtil.getOracleConnection());
    }






}
