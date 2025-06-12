public class Account_Line_Item {
    public Acc_Wrapper accWrap {set;get;}
    public Account_Line_Item (){
        accWrap = new Acc_Wrapper();       
    }
    public PageReference create(){
        PageReference p;
       SavePoint sp = Database.setSavepoint();
        try{
           Account acc = new Account();
            acc.Name = accWrap.Company;
            acc.Industry = accWrap.industry;
            acc.Phone = accWrap.phone;
          	insert acc;
            Contact con = new contact();
            con.LastName = accWrap.lastname;
            con.FirstName = accWrap.firstname;
            con.Email = accWrap.email;
            con.Phone = accWrap.phone;
            con.AccountId = acc.Id;
            insert con;
            Opportunity op = new Opportunity();
            op.Name = accWrap.Company+'_';
            op.StageName = 'Prospecting';
            op.CloseDate = System.today();
            op.AccountId = acc.id;
            insert op;
            p = new PageReference('/'+acc.Id);
        }catch(Exception e){
            Database.rollback(sp);
            Apexpages.Message msg = new Apexpages.Message(Apexpages.Severity.Error,e.getMessage());
        }
        return p;
    }
}