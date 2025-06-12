public class AccountUtils {
    public static List<Account> accountsByState(string state1){
        List<Account> lstAcc = [select Id, name from Account where BillingState = :state1];
        return lstAcc;
    }
}