//Return a map where the key is the contact Id and the value is Firstname + LastName
public class ContactNameMap {
    
    public static Map<id,string> getFullNames(List<id> contactIds){
        
        Map<id,string> nameMap = new Map<id,string>();
        List<contact> contacts = [select id,FirstName,lastName from contact where id IN :contactIds];
        
        for(contact c : contacts){
            nameMap.put(c.id,c.FirstName + ' ' + c.LastName);
        }
        system.debug('***' +nameMap);
        return nameMap;
    }

}