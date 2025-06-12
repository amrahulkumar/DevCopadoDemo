// fetch all opportunities for an account
// input - account id
// output - account related opportunities
public class AccountOpportunities {
    public static List<opportunity> accountrelatedOpp (id accountId){
       List<opportunity> relOpps = [select Id,Name,StageName from Opportunity where accountId =: accountId];
        system.debug('related opps' + relOpps);
        system.debug('related opps size' + relOpps.size());        
       return relOpps;
    }

}