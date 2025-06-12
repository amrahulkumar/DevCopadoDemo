//Write a method that takes a list of account IDs and returns a map of AccountId --> numbers of Contacts
public class contactsPerAccount {
    
    public static Map<id,integer> countContacts(List<Id> accountIds){
	Map<id,integer> contactsMap = new Map<id,integer>();
        for(AggregateResult ar : [select Accountid,Count(id) concount from Contact where Accountid IN:accountIds group by Accountid]){
            contactsMap.put((id) ar.get('Accountid'),(integer) ar.get('concount'));
        }
       system.debug('***' + contactsMap);
       return contactsMap;
   }
}