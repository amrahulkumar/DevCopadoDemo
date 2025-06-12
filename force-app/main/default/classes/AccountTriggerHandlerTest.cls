@isTest
public class AccountTriggerHandlerTest {
 
    @isTest static void testContactCreated(){
        Account acc = new Account(name='Test Acc');
        insert acc;
        List<Contact> cons = [select id from Contact where AccountId =: acc.id];
        system.assertEquals(1,cons.size());
    }

}