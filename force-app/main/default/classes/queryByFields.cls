public class queryByFields {
    public  List<SObject> queryUsingsObjectFields(String objApi,String fieldName,String value){
        String q = 'Select id,' + fieldName + ' FROM ' + objApi + ' WHERE ' + fieldName + ' =:value';
        return Database.query(q);                
    }
}