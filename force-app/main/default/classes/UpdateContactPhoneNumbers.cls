public class UpdateContactPhoneNumbers {
    public static void contactPhoneUpdate (List<contact> conLists){
        List<contact> contactstobeUpdated = new List<contact>();
        for(contact con : conLists){
            if(con.phone != null){
                con.phone = '+91' + con.Phone;
            }
           contactstobeUpdated.add(con);
        }
        update contactstobeUpdated;
    }
}