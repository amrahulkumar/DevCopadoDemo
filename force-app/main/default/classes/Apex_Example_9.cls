public class Apex_Example_9 {
    public void callMe(){
        User u = [select id from user where alias ='RKuma'];
        List<Opportunity> optyList = [select id,StageName from Opportunity where ownerId=:u.Id];
        for(Opportunity op:OptyList){
            op.stageName = 'Closed Won';
            op.CloseDate = System.today();
        }
        update OptyList;
    }
    
    public void show(){
        User u = [select id from user where alias='snote'];
        List<Opportunity> optyList = [select id,StageName from Opportunity where ownerId=: u.Id];
        delete OptyList;
    }
}