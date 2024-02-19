package utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    private static SimpleDateFormat DATE_FORMATER = new SimpleDateFormat("yyyy년 M월 d일");

    /**
     * 날짜를 전달받아 "2023년 1월21" 과 같은 형식의 문자열로 반환
     *
     * @param date 날짜
     * @return 형식
     */
    public static String toText(Date date) {
        if (date == null) {
            return "";
        }
        return DATE_FORMATER.format(date);
    }
    
    public static String toText(Date date, String pattern) {
    	if (date == null) {
    		return "";
    	}
    	SimpleDateFormat format = new SimpleDateFormat(pattern);
    	return format.format(date);
    }
    
    public static Date toDate(String text) {
    	return toDate(text, "yyyy-MM-dd");
    }
    
    public static Date toDate(String text, String pattern) {
    	
    	SimpleDateFormat format = new SimpleDateFormat(pattern);
    	 
    	if (text == null) {
    		throw new IllegalArgumentException("문자열이 null이어서 Date로 변환할 수 없습니다.");
    	}
    	 
    	try {
    		return format.parse(text);
    	} catch (ParseException ex) {
    	 	throw new IllegalArgumentException("문자열이 빈 문자이거나, 유효한 날짜형식이 아닙니다.");    		
    	}
    }
    
}
