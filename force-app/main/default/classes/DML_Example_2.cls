public class DML_Example_2 {
    public Account acc		{set;get;}
	public Contact con		{set;get;}
    public Opportunity opty	{set;get;}
        public DML_Example_2(){
            acc = New Account();
            con = New Contact();
            opty = New Opportunity();          
        }
    public PageReference create(){
        insert acc;
        System.debug(con.LastName);
        If (con.LastName != null){
        	con.AccountId = acc.id;
        	insert con;   
        }
        System.debug(opty.Name);
        If (opty.Name != null){
        opty.AccountId = acc.id;
        insert opty;
        }
        PageReference p = new PageReference('/' +acc.Id);
        return p;
     }
    public void cancel(){
        acc = new Account();
        con = new Contact();
        opty = new Opportunity();
    }
}