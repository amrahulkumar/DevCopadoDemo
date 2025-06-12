public class GroupingAccountContacts {
    
    public static Map<id,List<Contact>> groupedAccountContacts(List<Contact> givenCons){
        set<id> accountIds = new set<id>();
        for(Contact c : givenCons){
            if(c.AccountId != null){
                accountIds.add(c.AccountId);
            }
        }
        
        Map<id,List<Contact>> conMap = new Map<id,List<Contact>>();
        for(Contact c : [select AccountId,FirstName,LastName from Contact where AccountId IN :accountIds]){
            if(!conMap.containsKey(c.AccountId)){
               conMap.put(c.AccountId,new List<Contact>());
            }
			   conMap.get(c.AccountId).add(c);
        }
          
        return conMap;
    }
}