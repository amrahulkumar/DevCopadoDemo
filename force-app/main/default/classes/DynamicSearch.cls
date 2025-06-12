public class DynamicSearch { 
    public static List<SObject> dynamicSOQLSearch(String objectName,String fieldName){
        
        try{
            String myQuery = 'SELECT Id, ' + fieldName +  ' FROM ' + objectName + ' LIMIT 1';
            system.debug ('**Result**' + Database.query(myQuery));
            return Database.query(myQuery);
        }
        catch(Exception e){
            system.debug('Exception ' + e.getMessage());
            return null;
        }
    }
}