@isTest
public class testMixedDML {
    
    @isTest
    public static void testMixedDML(){
        Profile p =  [select id from Profile where Name ='Standard User'];
       	User u = new User();
        insert u;
        
        System.runAs(u){
            id accId = [select id from Account LIMIT 1].id;
            Contact c = new Contact(LastName='Test',AccountId=accId);
            insert c;
        }
    }
}