@isTest
public class Test_Example_7 {
	@isTest
    static void callMe(){
        Account acc = New Account();
        acc.name = 'Swiggy';
        acc.phone ='42534';
        acc.industry = 'Energy';
        insert acc;
        Apex_Example_7 ae = New Apex_Example_7();
        ae.callMe();
        Account a = [select id,rating from Account where Id=:acc.id];
        System.assertEquals('Hot', a.rating);
        
    }
    	@isTest
        static void callMe1(){
        Account acc1 = New Account();
        acc1.name = 'Zomato';
        acc1.phone ='56789';
        acc1.industry = '';
        insert acc1;
        Apex_Example_7 ae1 = New Apex_Example_7();
        ae1.invoke();
        Integer a1 = [select count() from Account where rating=''];
        System.assertEquals( 0, a1);
    }
}