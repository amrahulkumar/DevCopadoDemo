//Challenge : Create a method that inserts a new Account with name and phone number
//Challenge : Check if an account has a website.If not,set a default website.
public class createNewAccount {
    
    public static void addNewAccount(String name,String phone){
        Account acc = new Account(
            Name = name,
        	Phone = phone
        );
        insert acc;
 		system.debug('Account created' + acc);
    }
    
    //Adding website using a Account id - stored in a List
    public static void setDefaultWebsite(id accountId){
        List<account> accounts = [select id,name,website from Account where id=:accountId ];
        for(Account acc : accounts){
            if(acc.Website == null || acc.Website == ''){
                acc.Website = 'https://' + acc.Name + '.com';
            }
        }
        update accounts;
    }
    
    //Adding website  using a account variable
    public static void addDeafultWebsite(Account acc){
        if(String.isBlank(acc.Website)){
            acc.Website = 'https://myname.com';
            update acc;
        }
    }
    
}