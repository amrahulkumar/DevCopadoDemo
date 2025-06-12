trigger PreventContactDelete on Contact (before delete) {
    
    set<id> accountIds = new set<id>();
    for(contact c : Trigger.old){
        if(c.accountId != null){
            accountIds.add(c.AccountId);
        }
    }

    Map<id,Account> accMap = new Map<id,Account>([select id,Active__c from Account where id IN : accountIds]);
    for(Contact c : Trigger.old){
        Account acc = accMap.get(c.AccountId);
        if(acc != null && acc.Active__c == 'Active'){
            c.addError('Cannot delete contact from active Account');
        }
    }
    
}