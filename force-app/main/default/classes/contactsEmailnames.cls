public class contactsEmailnames {
    public static Map<string,string> contactEmailNamesMap(List<Contact> contacts){
        Map<string,string> contactsMap = new Map<string,string>();
        for(Contact con : contacts){
            contactsMap.put(con.LastName,con.Email);
        }      
        return contactsMap;
    }
}