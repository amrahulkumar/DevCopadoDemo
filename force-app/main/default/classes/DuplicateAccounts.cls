// Find the duplicate accounts using account names
public class DuplicateAccounts {
    public static Map<id,String> duplicateAccountsbyName(){
        List<String> orgnames = new List<String>();
        Map<id,String> dupnames = new Map<id,String>();
        
        for(Account acc : [select id,Name from Account]){
            if(orgnames.contains(acc.Name)){
                dupnames.put(acc.id,acc.Name);
            }
            else{
                orgnames.add(acc.Name);
            }
        }        
        return dupnames;
    }
}