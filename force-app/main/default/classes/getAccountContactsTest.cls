@isTest
private class getAccountContactsTest {


@IsTest
    public static void testgetgivenAccountContacts(){
        Account * = [Select id from Account where name = 'testAccount'];
        List<Contact> conList = getAccountContacts.getgivenAccountContacts(*.id);
        System.assertEquals(1, conList.size());
    }
}