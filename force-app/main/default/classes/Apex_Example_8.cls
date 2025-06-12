public class Apex_Example_8 {
    public void CallMe(){
        List<Opportunity> optyList = [select id,stagename,closeDate from opportunity];
        for(Opportunity op:optyList){
            op.stageName='Closed Won';
            op.closeDate=System.today();    
        }
        update optyList;
    }
    
    public void show(){
        List<Opportunity> optyDel = [select id from Opportunity where createdDate=TODAY];
        delete optyDel;
    }
}