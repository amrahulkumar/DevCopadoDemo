//map of account id to the number of related contacts
//count contacts per account
public class contactCounter {
    public static Map<id,integer> countContactsPerAccount(List<id> accountIds){
        Map<id,integer> countMap = new Map<id,integer>();
        List<Contact> contacts = [select Id,AccountId from contact where accountId IN : accountIds];
        for(contact c : contacts){
            if(countMap.containsKey(c.AccountId)){
                countMap.put(c.Accountid,countMap.get(c.Accountid)+1);
            }
            else{
                countMap.put(c.Accountid,1);
            }
        }
        system.debug('***' + countMap);
        return countMap;
    }
}