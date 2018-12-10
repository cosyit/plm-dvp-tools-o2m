package com.nio.o2m.common.util;

import com.alibaba.druid.pool.DruidDataSource;
import com.nio.o2m.common.enums.DataBaseInfoEnum;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * 双重校验模式单例
 * 单例的数据库连接池。
 *
 * 如何使用本类?
 *
 *
 */
public class MySQLDruidDataSourceSingleton extends DruidDataSource {
    private static final long serialVersionUID = 8867673526666638692L;
    //
    private volatile static MySQLDruidDataSourceSingleton instance;

    //私有构造函数。
    private MySQLDruidDataSourceSingleton() {
            initBeforeNew();
    }

    //双重锁单例
    public static MySQLDruidDataSourceSingleton getInstance() {
        if(instance == null){
            synchronized (MySQLDruidDataSourceSingleton.class){
                if(instance == null){
                    instance = new MySQLDruidDataSourceSingleton();
                }
            }
        }
        return instance;
    }

    //new 的前一秒发生的事情
    private void initBeforeNew(){
        //设置连接属性
        this.setUsername(DataBaseInfoEnum.TO_USERNAME.getInfo());
        this.setPassword(DataBaseInfoEnum.TO_PASSWORD.getInfo());
        this.setDriverClassName(DataBaseInfoEnum.TO_DRIVERCLASS.getInfo());
        this.setUrl(DataBaseInfoEnum.TO_JDBCURL.getInfo());

        //连接池属性
        this.setInitialSize(5);
        this.setMinIdle(1);
        this.setMaxActive(10);
        this.setPoolPreparedStatements(false);
    }


    //测试单例
    public static void main(String[] args) {
        if (MySQLDruidDataSourceSingleton.getInstance() == MySQLDruidDataSourceSingleton.getInstance()) {
            System.out.println("this has implements singleton!");
        }

        DruidDataSource dataSource = MySQLDruidDataSourceSingleton.getInstance();

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