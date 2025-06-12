public class duplicateLeads {
    public static List<String> duplicateLeadUsingEmail(List<lead> givenLeads){
        
        List<String> original = new List<String>();
        List<String> duplicate = new List<String>();
        
        for(Lead ld :givenLeads ){
            if(original.Contains(ld.email)){
                duplicate.add(ld.email);
            }
            else{
                original.add(ld.email);
            }
        }
        return duplicate;
    }
}