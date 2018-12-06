package com.nio.o2m.common.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 读取Class Path 下的Util类。
 */
public class ReadPropertiesFileUtil {
    /**
     * 获取配置文件中任意key对应value值
     * @param fileName properties文件位置。
     * @param key 文件的可以
     * @return
     */
    public static String getValueInPropertiesFilesByKey(String fileName,String key){
       //创建一个map 结构 用于收集数据的容器。
        Properties prop = new Properties();

        //从本文件的类类型开始，一路寻找类加载器->classPath->文件流。
        InputStream in = ReadPropertiesFileUtil.class.getClassLoader().getResourceAsStream(fileName);

        try {
            if(in == null ){
                System.out.println("fileName文件 不存在！请检查文件名是否正确。");
                return  "";
            }
            prop.load(in);

        } catch (IOException e) {
            e.printStackTrace();
        }
        //System.out.println(prop.getProperty(key).trim());
        return prop.getProperty(key.trim()).trim();
    }


    /**
     * 返回文件数据 Properties数据源
     * @param fileName
     * @return
     */
    public static Properties getMapDataInPropertiesFile(String fileName){
        //创建一个map 结构 用于收集数据的容器。
        Properties prop = new Properties();

        //从本文件的类类型开始，一路寻找类加载器->classPath->文件流。
        InputStream in = ReadPropertiesFileUtil.class.getClassLoader().getResourceAsStream(fileName);

        try {
            if(in == null ){
                System.out.println("fileName文件并不存在！请检查文件名是否正确。");
                throw new FileNotFoundException();
            }
            prop.load(in);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return prop;
    }

}
