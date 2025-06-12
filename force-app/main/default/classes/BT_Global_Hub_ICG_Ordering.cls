public class BT_Global_Hub_ICG_Ordering {

 /*       @AuraEnabled
    public static List <ICG_Data__mdt> getcountryspecCallType (string[] ReqID){
        List <ICG_Data__mdt> lstOfCon = [ select  Id,MasterLabel,Country__c,Tollfree__c,SharedCost__c,PSTN__c,Tollfree_New_Number__c,Tollfree_Porting__c,
                                         Shared_New_Number__c,Shared_Porting__c,PSTN_New_Number__c,PSTN_Porting__c from ICG_Data__mdt  
                                                     where Id IN : ReqID ];       
        return lstOfCon;
    }
    
    @AuraEnabled
    public static List <ICG_Data__mdt> getAllCountries(){
        List <ICG_Data__mdt> lstOfCon = [select  Id,MasterLabel,Country__c,Tollfree__c,SharedCost__c,PSTN__c,Tollfree_New_Number__c,Tollfree_Porting__c,
                                         Shared_New_Number__c,Shared_Porting__c,PSTN_New_Number__c,PSTN_Porting__c from ICG_Data__mdt
                                        order by Country__c];       
        return lstOfCon;
    }*/
    
    @AuraEnabled
    public static List <ICG_Tollfree__mdt> getAllCountries(){
        List <ICG_Tollfree__mdt> lstOfCon = [select Id,MasterLabel, Country__c,Tollfree__c, PSTN__c, SharedCost__c, ICG_Master_Tollfree__c, ICG_Master_Shared_Cost__c,
                                         ICG_Master_PSTN__c from ICG_Tollfree__mdt order by Country__c];       
        return lstOfCon;
    }
    
}