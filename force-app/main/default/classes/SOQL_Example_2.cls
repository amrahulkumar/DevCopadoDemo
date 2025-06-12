public class SOQL_Example_2 {
	public List<Account> accounts {get;set;}
	public SOQL_Example_2(){
		accounts = [SELECT Id,Name,Phone, CreatedDate,LastModifiedDate,Industry FROM Account];
	}
    
    /*********** To sort ASC ***************/
        public void sortNameAsc(){
        accounts = [SELECT Id,Name,Phone, CreatedDate,LastModifiedDate,Industry FROM Account Order by name Asc];
    }
    
    /*********** To Sort Desc ***************/
    public void sortNameDesc(){
        accounts = [SELECT Id,Name,Phone, CreatedDate,LastModifiedDate,Industry FROM Account Order by name Desc];
    }
}