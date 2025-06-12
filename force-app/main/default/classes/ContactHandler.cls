public class ContactHandler {
    
    public static void beforeInsertHandler(List<contact> contactlist){
        for(contact con : contactlist){
            system.debug('New contact inserted ' + con.LastName);
        }
        
    }
    
    public static void afterUpdateHandler(List<contact> newList, Map<Id,contact> oldMap){
        for(contact con : newList){
            if(con.Email != oldMap.get(con.Id).Email){
                system.debug('Email is updated ' + con.Email);
            }
        }
        
    }
}