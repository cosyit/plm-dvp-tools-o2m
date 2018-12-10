package com.nio.o2m.common.enums;

import com.nio.o2m.common.util.ReadPropertiesFileUtil;

public enum DataBaseInfoEnum {

    FROM_FILENAME("from.properties"),
//    FROM_FILENAME("mysql_test_from.properties"),
    TO_FILENAME("to.properties"),

    FROM_USERNAME(ReadPropertiesFileUtil.getValueInPropertiesFilesByKey(FROM_FILENAME.getInfo(), "username")),
    FROM_PASSWORD(ReadPropertiesFileUtil.getValueInPropertiesFilesByKey(FROM_FILENAME.getInfo(), "password")),
    FROM_JDBCURL(ReadPropertiesFileUtil.getValueInPropertiesFilesByKey(FROM_FILENAME.getInfo(), "jdbcUrl")),
    FROM_DRIVERCLASS(ReadPropertiesFileUtil.getValueInPropertiesFilesByKey(FROM_FILENAME.getInfo(), "driverClass")),
    FROM_SERVERIP(ReadPropertiesFileUtil.getValueInPropertiesFilesByKey(FROM_FILENAME.getInfo(), "ip")),
    FROM_SERVERPORT(ReadPropertiesFileUtil.getValueInPropertiesFilesByKey(FROM_FILENAME.getInfo(), "port")),




    TO_USERNAME(ReadPropertiesFileUtil.getValueInPropertiesFilesByKey(TO_FILENAME.getInfo(), "username")),
    TO_PASSWORD(ReadPropertiesFileUtil.getValueInPropertiesFilesByKey(TO_FILENAME.getInfo(), "password")),
    TO_JDBCURL(ReadPropertiesFileUtil.getValueInPropertiesFilesByKey(TO_FILENAME.getInfo(), "jdbcUrl")),
    TO_DRIVERCLASS(ReadPropertiesFileUtil.getValueInPropertiesFilesByKey(TO_FILENAME.getInfo(), "driverClass")),
    TO_SERVERIP(ReadPropertiesFileUtil.getValueInPropertiesFilesByKey(TO_FILENAME.getInfo(), "ip")),
    TO_SERVERPORT(ReadPropertiesFileUtil.getValueInPropertiesFilesByKey(TO_FILENAME.getInfo(), "port"));
    private String info;

    DataBaseInfoEnum(String info) {
        this.info = info;
    }

    public String getInfo() {
        return info;
    }
}
