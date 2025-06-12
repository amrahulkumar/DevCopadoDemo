public class OrderTriggerHandler {
	private static Boolean hasRun = false;
    
    public static void handleAfterUpdate(List<LeadConversionLog__c> orders){
        if(hasRun == true){
            return;
        }
        else{
            hasRun = true;
        }
        
       Set<Id> accountIds = new Set<Id>();
        for(LeadConversionLog__c ord : orders){
            if(ord.Status__c == 'Completed'){
                accountIds.add(ord.Account__c);
            }
        }
		
		Map<id,AggregateResult> ordersCounts = new Map<id,AggregateResult>();
        if(!accountIds.isEmpty()){
            ordersCounts = new Map<id,AggregateResult>(
            [select Account__c accId,COUNT(Id) counts from LeadConversionLog__c where Account__c IN :accountIds group by Account__c]);
        } 
        
        List<Account> accsToUpdate = new List<Account>();
        for(Id accId : ordersCounts.keySet()){
			Integer count = (integer) ordersCounts.get(accId).get('counts');
            Account acc = new Account();
            acc.id = accId;
            acc.Completed_Orders__c = count;
            accsToUpdate.add(acc);           
        }
        
        if(accsToUpdate.isEmpty() == false){
            update accsToUpdate;
        }
    }
}