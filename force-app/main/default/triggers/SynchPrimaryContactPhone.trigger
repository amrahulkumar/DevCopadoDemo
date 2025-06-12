trigger SynchPrimaryContactPhone on Contact (after insert,after update) {
    
    Map<Id,String> accountPhoneMap = new Map<Id,String>();
    for(contact con :  Trigger.new){
        if(con.IsPrimary__c == true && con.AccountId != null && con.Phone !=null){
            accountPhoneMap.put(con.AccountId,con.Phone);
        }
    }
    
    List<Account> accountToUpdate = new List<Account>();
    for(Id accId : accountPhoneMap.keySet()){
        Account acc = new Account();
        acc.id = accId;
        acc.Phone = accountPhoneMap.get(accId);
        accountToUpdate.add(acc);
    }
    
    if(!accountPhoneMap.isEmpty()){
        update accountToUpdate;
    }

}