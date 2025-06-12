public class getAccountContacts {
    public static List<Contact> fetchtheContactUsingAccount(id accountId) {
        List<Contact> conList = [select id,firstname,lastname from contact  where accountId =: accountId];
        system.debug('given Account Contacts' + conList);
        return conList;
    }
}