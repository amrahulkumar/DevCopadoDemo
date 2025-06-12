//Check the given string is palindrome or not and gives boolean result
public class palindrome {
    
    public static boolean checkPalindorme(String myinput){
        string result = myinput.reverse();
        Boolean compareresult = (myinput == result);

        system.debug('**compare result**' + compareresult);
        if(compareresult == true){
            return true;
        }
        else{
            return false;
        }
        
    }
}