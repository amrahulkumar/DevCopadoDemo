public class myContacts {
    public static List<Contact> getRelatedContacts(id accountId){
        return [select id,firstName,LastName from contact where AccountId =:accountId ];
    }
}