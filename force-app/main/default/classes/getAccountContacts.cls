public with sharing class getAccountContacts {
    public static List<Contact> getAccountContacts(id accountId) {
        List<Contact> conList = [select id,firstname,lastname from contact  where accountId =: accountId];
        return conList;
    }
}