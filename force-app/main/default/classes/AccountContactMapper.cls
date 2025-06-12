//Return a map of Account Id -> List of related Contacts.
public class AccountContactMapper {
    
    public static Map<id,List<contact>> getContactOfAccount(List<id> accountIds){
        
        Map<id,List<contact>> resultMap = new Map<id,List<contact>>();
        List<contact> contacts = [select id,Accountid,FirstName,LastName from contact where AccountId IN :accountIds];
        for (contact c: contacts){
            if(!resultMap.containsKey(c.AccountId)){
               resultMap.put(c.AccountId,new List<contact>());
            }
            resultMap.get(c.AccountId).add(c);
        }
        system.debug('***' + resultMap);
        return resultMap;
    }
}