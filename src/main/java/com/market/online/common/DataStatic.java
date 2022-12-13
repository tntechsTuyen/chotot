package com.market.online.common;

import java.util.Calendar;

public class DataStatic {
    public static class DATE {
        /**
         * yyyy: year
         * mm: month
         * dd: day
         * HH: hour
         * MM: minutes
         * ss: second
         * yyyy/mm/dd
         * yyyymmddHHMMss
         * */
        public static String FORMAT(String format){
            Calendar time = Calendar.getInstance();
            Integer year = time.get(Calendar.YEAR);
            Integer month = time.get(Calendar.MONTH) + 1;
            Integer day = time.get(Calendar.DAY_OF_MONTH);
            Integer hour = time.get(Calendar.HOUR_OF_DAY);
            Integer minute = time.get(Calendar.MINUTE);
            Integer second = time.get(Calendar.SECOND);
            return format.replaceAll("yyyy", year.toString())
                    .replaceAll("mm", month.toString())
                    .replaceAll("dd", day.toString())
                    .replaceAll("HH", hour.toString())
                    .replaceAll("MM", minute.toString())
                    .replaceAll("ss", second.toString());
        }
    }
}
