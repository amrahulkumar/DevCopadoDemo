public class Apex_Example_7 {
    public void callMe(){
        List<Account> accounts = [select id,rating from account];
        for(account a:accounts){
            a.rating='Hot';       
        }
        update accounts;
    }
    public void invoke(){
        List<Account> accounts = [select id from Account where rating=''];
        delete accounts;
    }
}