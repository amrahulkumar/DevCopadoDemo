public class ContactMaster {
    
    public static List<Contact> getContactList () {
        List<Contact> myCons = [select Id,Name,Title,Phone from contact LIMIT 10];
        system.debug('***' + myCons);
        return myCons; 
    }

}