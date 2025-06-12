//Write a method that recieves a List<Contact> and prints each contact's Name and email.
//Write a method that updates the domain in each contact's email.
//Get all contacts related to a given Account ID.

public class printContact {
    
    //Read the contactEmail details
    public static void printContactNameEmail(List<contact> contactList){
        for(contact c : contactList){
            system.debug('FirstName' + c.FirstName + '--' + 'LastName'+ c.LastName + '---' + 'Phone' + c.Phone);
        }
    }
    
    
    //Update Contact's Email
    public static void updateEmails(List<Contact> contacts){
        try{
                for(contact c : contacts){
                    if(c.Email == null){
                        c.Email = 'myname@gmail.com';
                    }
        		}
        		update contacts; 
        	}
        catch(Exception e){
            system.debug('**Error' + e.getMessage());
        }
    }
    

    
}