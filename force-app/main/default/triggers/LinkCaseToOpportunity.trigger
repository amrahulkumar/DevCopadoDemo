trigger LinkCaseToOpportunity on Case (before insert) {
    
    
    set<id> accountIds = new set<id>();
    for(Case c : Trigger.new){
        if(c.AccountId != null){
            accountIds.add(c.AccountId);
        }
    }
    
    Map<Id,Opportunity> lastestOpps = new Map<Id,Opportunity>();
    for(Opportunity opp : [select id,AccountId,CloseDate from Opportunity where AccountId IN :accountIds order by CloseDate  desc]){
        if(!lastestOpps.containsKey(opp.AccountId)){
            lastestOpps.put(opp.AccountId,opp);
        }
    }
    
    for(case c : Trigger.new){
        Opportunity latestOpp = lastestOpps.get(c.AccountId);
        if(latestOpp !=null){
            c.OpportunityId__c = latestOpp.id;
        }
    }

    
}