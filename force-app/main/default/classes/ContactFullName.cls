public class ContactFullName {
    
    public static String getFullContactName(id ContactId){
        
    contact con = [select firstname,lastname from contact where id =: ContactId LIMIT 1];
	String FullName = con.FirstName + ' ' + con.LastName;
	system.debug('**Fullname**' + FullName);        
    return FullName;   
        
    }
}