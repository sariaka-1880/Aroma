package utils;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Locale;
public class Util {
    public static int getCurrentYear(){
        LocalDate currentDate = LocalDate.now();
        int currentYear = currentDate.getYear();
        return currentYear;
    }
    public static int getCurrentMonth(){
        Calendar calendar = Calendar.getInstance();
        int monthIndex = calendar.get(Calendar.MONTH) + 1;
        return monthIndex;
    }
    public static String format(double number){
        NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.FRANCE);
        String formattedNumber = numberFormat.format(number);
        return formattedNumber;
    }
}
