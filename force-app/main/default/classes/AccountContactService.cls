public class AccountContactService {
	
    public static List<AccountwithContactsWrapper> getAccountsAndContacts(){
        List<AccountwithContactsWrapper> results = new List<AccountwithContactsWrapper>();
        
        List<Account> accounts = [select id,Name,Industry,(select id,firstname,lastname from contacts) from Account LIMIT 10];
        for(Account acc : accounts){
            List<Contact> relatedContacts = acc.Contacts;
            results.add(new AccountwithContactsWrapper(acc,relatedContacts));
        }     	       
        return results;
    }
}