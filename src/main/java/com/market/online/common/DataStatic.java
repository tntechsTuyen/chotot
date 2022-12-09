package com.market.online.common;

import java.util.Calendar;

public class DataStatic {
    public static class FILE{
        public static String SUB_FOLDER(boolean isParent){
            Calendar time = Calendar.getInstance();
            Integer year = time.get(Calendar.YEAR);
            Integer month = time.get(Calendar.MONTH) + 1;
            Integer day = time.get(Calendar.DAY_OF_MONTH);
            if(isParent){
                return "/"+year+"/"+month+"/"+day+"/";
            }else{
                return year+"/"+month+"/"+day+"/";
            }
        }
    }
}
