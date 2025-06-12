public class StringReverse {
    
    public static String reverseString(String input){
        String result = '';
        for (integer i = input.length()-1; i >=0 ; i-- ){
            result += input.charAt(i);
            system.debug('result--' + input.charAt(i));
        }
        system.debug('final result--' + result);
        return result;
    }

}