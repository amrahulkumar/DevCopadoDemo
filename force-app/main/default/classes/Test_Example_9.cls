@isTest
public class Test_Example_9 {
	@testsetup static void callMe(){
        Opportunity op = New Opportunity();
        op.Name = 'Classmate';
        op.StageName = 'Closed Won';
        op.CloseDate = System.today();
        insert op;
    }
    
          @isTest
    static void show(){
    User u = [select id from user where alias ='RKuma'];
    List<Opportunity> optyList = [select id,StageName from Opportunity where ownerId=:u.Id];
    }
}