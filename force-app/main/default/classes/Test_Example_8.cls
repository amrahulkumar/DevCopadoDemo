@isTest
public class Test_Example_8 {
    @isTest
    static void CallMe(){
    	Opportunity op = new Opportunity();
    	op.name = 'FoodPanda';
        op.StageName = 'Prospecting';
        op.CloseDate = System.today()+1;
        insert op;
        
    	Opportunity up = [select name,stagename,closedate from opportunity where name ='FoodPanda'];
        up.StageName = 'Closed Won';
        up.CloseDate = System.today();
        update up;        
        
        Apex_Example_8 ae = New Apex_Example_8();
        ae.CallMe();
        Opportunity opp = [select name,stagename,closedate from opportunity where name ='FoodPanda'];          
        System.assertEquals('FoodPanda', opp.Name);
        System.assertEquals('Closed Won', opp.StageName);
        System.assertEquals(System.today(), opp.CloseDate);  
   
    }
	@isTest
    static void TestMe(){
        Opportunity op1 = new Opportunity();
    	op1.name = 'FoodExpress';
        op1.StageName = 'Prospecting';
        op1.CloseDate = System.today();
        insert op1;
        Apex_Example_8 ae1 = New Apex_Example_8();
        ae1.show();
        integer opdel = [select count() from Opportunity where createdDate= TODAY];
        System.assertEquals(0, opdel);
    }
}