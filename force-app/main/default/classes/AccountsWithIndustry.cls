//Challenge : Write a method that returns a list of Accounts Where the Industry is 'Technology'

public class AccountsWithIndustry {
    public static List<Account> myAccounts(){
        return [select id,Name,phone from Account where Industry = 'Technology'];
    }
}