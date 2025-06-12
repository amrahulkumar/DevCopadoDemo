//Challenge to update type as Key Customer for an account having more than 5 related contacts
public class AccountswithSixContacts {
    public static void updateAccountswithContacts(List<id> accountIds){
        List<AggregateResult> results = [select AccountId, Count(Id) ContactCons from Contact where AccountId != null GROUP BY AccountId ];        
        List<Account> toUpdate = new List<Account>();
        for(AggregateResult ar : results){
            if((integer) ar.get('ContactCons') > 5){
                toUpdate.add(new Account(id = (Id) ar.get('AccountId'),Type='Key Customer'));
            }
        }
		update toUpdate;
    }
}