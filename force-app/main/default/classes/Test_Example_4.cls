@isTest
public class Test_Example_4 {
    testmethod static void testMe(){
        Apex_Example_4 ae = New Apex_Example_4();
        ae.leadsource = 'Web';
        ae.show();
        System.assertEquals('Kumar',ae.lastname);
        System.assertEquals('Rahul',ae.firstname);
        ae.leadsource = 'Email';
        ae.show();
        System.assertEquals('Rudra', ae.lastname);
        System.assertEquals('Srinivas', ae.firstname);        
    }
}