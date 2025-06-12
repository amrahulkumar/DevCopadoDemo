public class checkevennumber {
    public static String checkEvenOrOdd(Integer num) {
        Integer result = (num / 2);
        if (result * 2 == num) {
            system.debug ('***even**');
            return num + ' is even';
        } else {
            system.debug ('***odd**');
            return num + ' is odd';
        }
    }
}