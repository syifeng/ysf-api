package com.ds.api.web.convert;

import org.apache.log4j.Logger;
import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 全局日期处理类
 * Convert<T,S>
 *         泛型T:代表客户端提交的参数 String
 *         泛型S:通过convert转换的类型

 */
public class DateConvert implements Converter<String, Date> {
    private Logger logger = Logger.getLogger(DateConvert.class);
    @Override
    public Date convert(String stringDate) {
        int length = stringDate==null?0:stringDate.length();
        SimpleDateFormat simpleDateFormat;
        switch (length){
            case 10:{
                simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            }break;
            case 13:{
                try {
                    return new Date(Long.parseLong(stringDate));
                }catch (Exception e){
                    simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH");
                }

            }break;
            case 16:{
                simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            }break;
            case 19:{
                simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            }break;
            default:{
                return null;
            }
        }
        try {
            return simpleDateFormat.parse(stringDate);
        } catch (ParseException e) {
            logger.error("",e);
        }
        return null;
    }

}

