//Class to capitalize each word in a string

public class CapitalizeEachWord {
    public static string capitalizeWords(string input){
        if(string.isBlank(input)){
            return input;
        }
        
		String[] words = input.toLowerCase().split('');
      	List<String> capitalizedWords = new List<String>();
        for(String word : words ){
            if(word.length() > 0){
                String capitalized = word.substring(0,1).toUpperCase()+word.substring(1);
                capitalizedWords.add(capitalized);
            }
            else{
                capitalizedWords.add('');
            }

        }
        
        return String.join(capitalizedWords,'');
    }
}