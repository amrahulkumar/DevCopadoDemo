public class SOQL_Example_1 {
	public List<Account> accounts {get;set;}
	public SOQL_Example_1(){
		accounts = [SELECT Id,Name,Phone, CreatedDate,LastModifiedDate,Industry FROM Account];
	}
    
    /*********** To get all records even from recyclebin ***************/
        public void fetchAll(){
        accounts = [SELECT Id,Name,Phone, CreatedDate,LastModifiedDate,Industry FROM Account ALL ROWS];
    }
    
    /*********** Limit the results ***************/
    public void setLimit(){
        accounts = [SELECT Id,Name,Phone, CreatedDate,LastModifiedDate,Industry FROM Account Limit 5];
    }
    
    /*********** User defined limit dynamic using variable ***************/
    public void setMyLimit(){
        integer count = 3;
        accounts = [SELECT Id,Name,Phone, CreatedDate,LastModifiedDate,Industry FROM Account Limit :count];
    }
    
    /*********** From which position records should be retrurned ***************/
    public void offSet(){
        accounts = [SELECT Id,Name,Phone, CreatedDate,LastModifiedDate,Industry FROM Account offset 5];
    }
    
    
    /*********** From which position records should be retrurned ***************/
    public void myoffSet(){
         integer count = 3;
        accounts = [SELECT Id,Name,Phone, CreatedDate,LastModifiedDate,Industry FROM Account offset :count];
    }
    
    /*********** Offset with Limits ***************/
    public void offsetLimt(){
        Integer limit_n = 5;
        Integer offset_n = 10;
        accounts = [SELECT Id,Name,Phone, CreatedDate,LastModifiedDate,Industry FROM Account Limit :limit_n offset :offset_n];
    }
    
    
}