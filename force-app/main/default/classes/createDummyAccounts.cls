//class to create 10 dummy accounts

public class createDummyAccounts {
    public static void createdummyacc (){
        List<account> dummyaccounts = new List<account>();
        for(integer i=1 ; i<=10 ; i++){
            Account acc = new Account();
            acc.Name = 'DummyAccount' + i;
            dummyaccounts.add(acc); 
        }
		insert dummyaccounts;
    }
}