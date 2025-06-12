//Challenge - Write a method that takes a list of integers and returns only the even numbers.
public class getEvenNumbers {
    public static List<integer> checkTheGivenNumber( List<integer> mynumList){
        List<integer> evens = new List<integer>();
        for(integer i : mynumList ){
            if (i/2 > 1){
               evens.add(i); 
            }
        }       
        return evens;
    }
}