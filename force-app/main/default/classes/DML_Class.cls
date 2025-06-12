public class DML_Class {
    public String accName 	{set;get;}
    public String phone 	{set;get;}
    public string industry 	{set;get;}
    public string rating 	{set;get;}
    
    public PageReference create(){
        Integer count = [select count() from account where name=:accName];
		PageReference p;
        
        
        if(count>0){
             //if the count is greater than xero, then duplicate record exists.
        	//throw error message and value p is null
            Apexpages.Message msg = new Apexpages.Message(Apexpages.Severity.Error,'Duplicate Record Exists');
            ApexPages.addMessage(msg);
        }else {
            //no duplicate record exists then insert account and navigate to detail page of the record.
            Account acc = new Account();
            acc.Name = accName;
            acc.Phone = phone;
            acc.Industry = industry;
            acc.rating = rating;
            insert acc;
            p = new PageReference('/'+ acc.Id);
        }
        return p;
    }
    public void cancel(){
        accName = null;
        phone = null;
        industry = null;
        rating = null;
    }          
}