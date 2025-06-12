public class AccountWithContactsWrapper {
    public Account acc{get;set;}
    public List<Contact> contacts{get;set;}
    
    public AccountWithContactsWrapper(Account acc,List<Contact> contacts){
        this.acc = acc;
        this.contacts = contacts;
    }
}