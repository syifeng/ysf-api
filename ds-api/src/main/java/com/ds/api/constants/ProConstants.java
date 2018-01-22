package com.ds.api.constants;

import org.springframework.context.ApplicationContext;

/**
 * Created by WD_Huangming on 2017/1/9.
 */
public class ProConstants {
    public static String RESOURCE_URL = "";
    public static String APP_BASE_PATH = "";
    public static String CONFIG = "appConfig";
    public static String CSS_THEME = "default";
    public static Boolean DEBUG_MODE = false;
    public static String DEFAULT_FILE_SCHOOL_BADGE = "public/images/school_badge_default.jpg";
    public static String SCHOOL_CODE = "";          //当前学校代码
    /****文件路径 ******/
    public static String SIMS_FILE_DIRECTORY_BASE = "";  //上传文件根目录
    public static String SIMS_FILE_DIRECTORY_IMAGES = "";  //图片存储路径
    public static String SIMS_FILE_DIRECTORY_ARTICLE = "";  //文章存储路径


    public static ApplicationContext ctx = null;

    public static String SIMS_API_RECORD;
}
