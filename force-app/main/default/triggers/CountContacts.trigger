trigger CountContacts on Contact (after insert,after delete) {
    
    //Collect the Account Ids- unique hence they are in set
	set<id> accountIds = new set<id>();
    if(Trigger.isInsert || Trigger.isDelete){
        for(Contact con : Trigger.isInsert ? Trigger.new : Trigger.old){
            if(con.AccountId !=null){
                accountIds.add(con.AccountId);
            }
        }
    }
    
    Map<id,integer> contactCounts = new Map<id,integer>();
    for(AggregateResult ar :[select AccountId,Count(id) counts from Contact Where AccountId != null group by AccountId]){
        contactCounts.put((id)ar.get('AccountId'),(integer) ar.get('counts'));
    }
    
    List<Account> updates = new List<Account>();
    for(id accId : accountIds){
        updates.add(new Account(id=accId,Count_of_Contacts__c = String.valueOf(contactCounts.get(accId))));
    }
    update updates;
}