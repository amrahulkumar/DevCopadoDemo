public class dynamicSOQL {
    public static SObject getFirstRecord(String objectName){
        try{
            String query = 'Select Id from ' + objectName + ' LIMIT 1';
            system.debug (Database.query(query));
            return Database.query(query);
        }
        catch(exception e){
            system.debug('**Error' + e.getMessage());
            return null;
        }
    }
}