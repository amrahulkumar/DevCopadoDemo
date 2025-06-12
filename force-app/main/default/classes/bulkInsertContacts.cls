public class bulkInsertContacts {
    
    public static List<Contact> defaultContacts(id accountId,integer count){  
        
        List<Contact> contacts = new List<Contact>();
        for(integer i=0 ; i < count ; i++ ){
            contacts.add(new Contact(Lastname = 'Contact' +i, AccountId = accountId));
        }

        try{
                insert contacts;
        		return contacts;
        }
        catch(exception e){
            system.debug('***' + e.getMessage());
            return null;
        }

    }
}