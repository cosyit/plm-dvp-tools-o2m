package com.nio.o2m.common.enums;

import com.nio.o2m.common.util.ReadPropertiesFileUtil;

public enum DataBaseInfoEnum {

    FROM_FILENAME("from.properties"),
    TO_FILENAME("to.properties"),

    FROM_USERNAME(ReadPropertiesFileUtil.getValueInPropertiesFilesByKey(FROM_FILENAME.getInfo(), "username")),
    FROM_PASSWORD(ReadPropertiesFileUtil.getValueInPropertiesFilesByKey(FROM_FILENAME.getInfo(), "password")),
    FROM_JDBCURL(ReadPropertiesFileUtil.getValueInPropertiesFilesByKey(FROM_FILENAME.getInfo(), "jdbcUrl")),
    FROM_DRIVERCLASS(ReadPropertiesFileUtil.getValueInPropertiesFilesByKey(FROM_FILENAME.getInfo(), "driverClass")),
    FROM_SERVERIP(ReadPropertiesFileUtil.getValueInPropertiesFilesByKey(FROM_FILENAME.getInfo(), "ip")),
    FROM_SERVERPORT(ReadPropertiesFileUtil.getValueInPropertiesFilesByKey(FROM_FILENAME.getInfo(), "port"));
    private String info;

    DataBaseInfoEnum(String info) {
        this.info = info;
    }

    public String getInfo() {
        return info;
    }
}
