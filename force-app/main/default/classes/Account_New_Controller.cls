public class Account_New_Controller {
    
    // Here data will save as SObject
    public Account acc {set;get;}
    //Constructor with paramter Apexpages.StandardController
    //using Apexpages.StandardController controller the record which working record control given 
    //to Visual force page as parameter.

    public Account_New_Controller(Apexpages.StandardController controller){
        //Converts it into sObject and we are not sure which object we are taking in controller 
        acc = (Account)controller.getRecord();
    }
    public PageReference save(){
        PageReference p;
        Integer count = [select count() from Account where name=:acc.Name];
        if(count >0){
            Apexpages.Message msg = new Apexpages.Message(Apexpages.Severity.ERROR,'Duplicate record found');
            Apexpages.addMessage(msg);
        }else{
            insert acc;
            p=new PageReference('/'+acc.id);
        }
        return p;
    }
}