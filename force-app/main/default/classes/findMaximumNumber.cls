//Class to find the maximum of three numbers
public class findMaximumNumber {
    public static integer maxnumber(integer input1, integer input2, integer input3){
        if( input1 > input2) {
            system.debug ('***' + input1);
            return input1;
        }
        else if(input2 > input3){
            system.debug ('***' + input2);
            return input2;
        }
        else{
            system.debug ('***' + input3);
            return input3;
        }
    }
    
    //using math.max(var1,var2) method
    public static integer maxnumusingMath(integer a, integer b, integer c){
        return Math.max(a,Math.max(b,c));
    }
}