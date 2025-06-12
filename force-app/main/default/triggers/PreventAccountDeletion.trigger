trigger PreventAccountDeletion on Account (before delete) {
    
    //Step1 - collect the account Ids
    set<id> accountIdsToDelete = new set<id>();
    for (account acc : trigger.old){
        accountIdsToDelete.add(acc.id);
    }
    
    //Step2 - Query opportunity related to the above collected Accounts
    Map<id,integer> accountOpportunityCountMap = new Map<id,integer>();
    for(AggregateResult result : [select Accountid,count(id)total from opportunity where AccountId in :accountIdsToDelete group by Accountid]){
        accountOpportunityCountMap.put((id) result.get('Accountid'),(integer) result.get('total'));
    }
    
    //step3- Prevent Deletion if opportunity exists
    for(Account acc : Trigger.old){
        if(accountOpportunityCountMap.containsKey(acc.id)){
            acc.addError('Account cannot be deleted due to related opportunities');
        }
    }
    
    
}