@isTest
public class Test_Example_6 {
	@isTest
    static void CallMe(){
        Apex_Example_6 opp = new Apex_Example_6();
        opp.create();
        Opportunity op = [select id,name,stageName,CloseDate from Opportunity];
        System.assertEquals('Apple12', op.Name);
        System.assertEquals('Closed Won', op.StageName);
        System.assertEquals(System.today()+15, op.CloseDate);
    }
}