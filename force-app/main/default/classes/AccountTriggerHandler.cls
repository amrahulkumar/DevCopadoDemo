public class AccountTriggerHandler {
    public static void accountContact(List<Account> accounts){
       List<Contact> contacts = new List<Contact>();
           for(Account acc : accounts){
                contacts.add(new Contact(Lastname = acc.Name,Accountid = acc.id)); 
            }
    	insert contacts;
    	}
}