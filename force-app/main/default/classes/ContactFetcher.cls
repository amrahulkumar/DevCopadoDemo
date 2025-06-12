public class ContactFetcher {
    public static List<Contact> getTopContacts(){
        return [select id,firstname,lastname from contact];
    }

}