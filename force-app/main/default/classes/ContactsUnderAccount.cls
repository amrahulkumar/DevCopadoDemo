//Class to get the related counts for the give contact
public class ContactsUnderAccount {
    public static Integer AccountRelatedContacts(id accountId){
        if(accountId == null || accountId ==''){
            throw new IllegalArgumentException('Account ID cannot be null');
        }
        Integer totalcontacts =  [select count() from contact where accountId =: accountId ]; 
        system.debug('**Related Counts for given account**' + totalcontacts);
        return totalcontacts;
    }
}