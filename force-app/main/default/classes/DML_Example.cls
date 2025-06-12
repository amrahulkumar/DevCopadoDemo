public class DML_Example {
    public Account acc		{set;get;}
	public Contact con		{set;get;}
    public Opportunity opty	{set;get;}
        public DML_Example(){
            acc = New Account();
            con = New Contact();
            opty = New Opportunity();          
        }
    public PageReference create(){
        insert acc;
        con.AccountId = acc.id;
        insert con;
        opty.AccountId = acc.id;
        insert opty;
        PageReference p = new PageReference('/' +acc.Id);
        return p;
     }
    public void cancel(){
        acc = new Account();
        con = new Contact();
        opty = new Opportunity();
    }
}