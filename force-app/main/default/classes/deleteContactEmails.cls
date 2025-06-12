//Write a method to delete all contacts that don't have an email.

public class deleteContactEmails {
    public static void deleteBlankContactEmails(){
        List<contact> delCons = [select id,LastName from Contact where email = null];
        delete delCons;
    }
}