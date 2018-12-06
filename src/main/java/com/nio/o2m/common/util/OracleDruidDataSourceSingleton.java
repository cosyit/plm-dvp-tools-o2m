package com.nio.o2m.common.util;

import java.sql.Connection;
import java.sql.SQLException;

import com.alibaba.druid.pool.DruidDataSource;
import com.nio.o2m.common.enums.DataBaseInfoEnum;

/**
 * 双重校验模式单例
 * 单例的数据库连接池。
 *
 * 如何使用本类?
 *
 *
 */
public class OracleDruidDataSourceSingleton extends DruidDataSource {
    private static final long serialVersionUID = 8867673526666638692L;
    //
    private volatile static OracleDruidDataSourceSingleton instance;

    //私有构造函数。
    private OracleDruidDataSourceSingleton() {
            initBeforeNew();
    }

    //双重锁单例
    public static OracleDruidDataSourceSingleton getInstance() {
        if(instance == null){
            synchronized (OracleDruidDataSourceSingleton.class){
                if(instance == null){
                    instance = new OracleDruidDataSourceSingleton();
                }
            }
        }
        return instance;
    }

    //new 的前一秒发生的事情
    private void initBeforeNew(){
        //设置连接属性
        this.setUsername(DataBaseInfoEnum.FROM_USERNAME.getInfo());
        this.setPassword(DataBaseInfoEnum.FROM_PASSWORD.getInfo());
        this.setDriverClassName(DataBaseInfoEnum.FROM_DRIVERCLASS.getInfo());
        this.setUrl(DataBaseInfoEnum.FROM_JDBCURL.getInfo());

        //连接池属性
        this.setInitialSize(5);
        this.setMinIdle(1);
        this.setMaxActive(10);
        this.setPoolPreparedStatements(false);
    }


    //测试单例
    public static void main(String[] args) {
        if (OracleDruidDataSourceSingleton.getInstance() == OracleDruidDataSourceSingleton.getInstance()) {
            System.out.println("this has implements singleton!");
        }

        DruidDataSource dataSource = OracleDruidDataSourceSingleton.getInstance();

        try {
            //需要连接直接拿，需要关闭直接关闭。
            Connection connection = dataSource.getConnection();
            System.out.println(connection);
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
} 