//Write a method that takes a list of contact IDs and returns a Map<Id,String> where key = contact Id and value = Email
//Hint: use SOQL query id,email from contact.

public class contactEmailMap {

    public static Map<id,string> contactIDandEmail(List<id> contactIds){
        Map<id,string> resultMap = new Map<id,string>();
        List<contact> contacts = [select id,Email from contact where id IN : contactIds];
        for(contact c : contacts){
            resultMap.put(c.id,c.Email);
        }
        system.debug('***' + resultMap);
        return resultMap;
    }
}