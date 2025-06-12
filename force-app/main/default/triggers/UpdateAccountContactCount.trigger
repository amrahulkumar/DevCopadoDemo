/** Scenario - When a conatct is inserted,updated,deleted update the Contact_Count__c field on Account **/
trigger UpdateAccountContactCount on Contact (after insert,after update,after delete,after undelete) {

    Set<Id> accountIds = new Set<Id>();
    
    if(Trigger.Isinsert || Trigger.isUndelete){
            for(contact con : Trigger.new){
                if(con.AccountId != null){
                    accountIds.add(con.AccountId);
                }
            }
    }
    
    if(Trigger.IsDelete){
        for(contact con : Trigger.old){
            if(con.AccountId != null){
                accountIds.add(con.AccountId);
            }
        }
    }
    
    if(accountIds.size() > 0){
        
        List<Account> updatedAccounts = new List<Account>();
        for(AggregateResult ar : [select AccountId, Count(Id) relatedcontacts  from contact where AccountId IN : accountIds Group by AccountId ]){
            updatedAccounts.add(new Account(
            id = (Id) ar.get('AccountId'),
            Contact_Count__c  = (Integer) ar.get('relatedcontacts')        
            ));
            
        }
    
        if(!updatedAccounts.IsEmpty()){
            try{
               update  updatedAccounts;
            }
            catch (exception e) {
                system.debug( 'Update failed :' + e.getMessage());
            }
        }
        
    }
    
}