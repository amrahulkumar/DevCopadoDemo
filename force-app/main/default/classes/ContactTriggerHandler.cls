public class ContactTriggerHandler {
    
    public static Boolean isExecuted = false;
    public static Set<Id> processedIds = new Set<Id>();
    
    public static void beforeinsertHandler(List<Contact> conList){
        if(isExecuted == false){
            for(Contact con : conList){
                if(con.Phone == null && con.Id !=null){
                    con.Phone = '11111111';
                    processedIds.add(con.Id);
                }              
    		}
            
        }        
        isExecuted = true;
        system.debug('***beforeinsertHandler-Executed--' + 'isExecuted--' + isExecuted);
    }
    public static void afterUpdateHandler(List<Contact> conList){
         if(isExecuted == false){
             for(Contact con : conList){
                if(con.Email !=null && con.Id !=null) {
                    con.Email = con.Email;
                    processedIds.add(con.Id);
                }
            }
         }        
        isExecuted = true;
        system.debug('***afterUpdateHandler-Executed--' + 'isExecuted--' + isExecuted);
    }
    
}