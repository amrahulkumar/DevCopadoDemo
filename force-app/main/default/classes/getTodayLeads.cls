//Get All leads created Today
//input - created date today
//output - all created leads of today

public class getTodayLeads {
    
    public static List<lead> todaysleads (){
        List<lead> myleads = [select id,Name from lead where CreatedDate = TODAY];
        system.debug('myleads' + myleads.size()); 
 		system.debug('myleads' + myleads);    
        return myleads;
    }
	
}