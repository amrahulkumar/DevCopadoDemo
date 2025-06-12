public class AccountCustomException extends Exception {
    public static void validateAccountName(Account acc){
        if(String.isBlank(acc.Name)){
            throw new AccountCustomException('Account name should not start with Dummy - Custom Exception Class AccountCustomException');
        }
    }
}