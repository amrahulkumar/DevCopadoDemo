public class DML_Example_3 {
    public Account acc 				{set;get;}
    public List<contact> contacts 	{set;get;}
    public DML_Example_3(){
        acc = new Account();
        contacts = new List<Contact>();
        add();     
    }
    public void add(){
        contact c = new contact();
        contacts.add(c);
    }
    public PageReference create(){
        insert acc;
        for(Contact c :contacts){
            c.AccountId = acc.id;
        }
        insert contacts;
        PageReference p = new PageReference('/'+acc.id);
        return p;
    }
        public void cancel(){
        acc.Name = null;
        acc.Phone = null;
        acc.Industry = null;
        acc.Rating = null;
    }  
}