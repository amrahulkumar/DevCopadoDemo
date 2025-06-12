public class displayContacts {
    
    public static void showContactName(List<contact> contactList){
        for(contact con : contactList){
            system.debug('Contact Name '+ con.FirstName + ' ' + con.LastName + '; Contact Email ' + con.Email);
        }
    }
}