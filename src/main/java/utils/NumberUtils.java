package utils;

public class NumberUtils {


    public static int toInt(String text, int defaultValue) {
        if (text == null) {
            return defaultValue;
        }
        if (text.isBlank()) {
            return defaultValue;
        }
        try {
            return Integer.valueOf(text);
        } catch (NumberFormatException e) {
            return defaultValue;
        }

    }

    /**
     * 텍스트를 전달받아 정수로 변환된 값을 반환
     *
     * @param text 숫자로 구성된 문자열
     * @return 정수값 , 문자열이 null 이거나 비어있거나 숫자로만 구성되어 있지 않으면 0 을 반환
     */
    public static int toInt(String text) {
        return toInt(text, 0);
    }
}
