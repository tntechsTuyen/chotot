package com.market.online.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    /**
     * @type: yyyy-> year
     * @type: MM-> month
     * @type: dd-> day
     * @type: hh-> hours
     * @type: mm-> minutes
     * @type: ss-> seconds
     * @type: SSS-> milliseconds
     * */
    public static String format(String patten){
        SimpleDateFormat formatter = new SimpleDateFormat(patten);
        return formatter.format(new Date());
    }
}
