public class getAccountContacts {
    public static List<Contact> getgivenAccountContacts(id accountId) {
        List<Contact> conList = [select id,firstname,lastname from contact  where accountId =: accountId];
        system.debug('given Account Contacts' + conList);
        return conList;
    }
}