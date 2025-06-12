//Check for duplicate emails
//Maintain two sets using if email not present add in a set otherwise in another set

public class contactDuplicateEmails {
    
    public static Set<string> checkContactDuplicateEmails(){        
        set<String> seen = new Set<String>();
        set<String> dupemails = new Set<String>();
        
        for(Contact c : [select id,LastName,Email from contact]){
            if(seen.Contains(c.Email)){
                dupemails.add(c.Email);
            }
            else{
                seen.add(c.Email);
            }
        }        
        return dupemails;
    }
}