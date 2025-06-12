trigger PublishCaseClosedEvent on Case (after update) {
    List<Case_Closed__e> events = new List<Case_Closed__e>();
    
    for(Case cs : Trigger.new){
        Case oldCs = Trigger.oldMap.get(cs.Id);
        if(cs.Status == 'Escalated' && oldCs.Status != 'Closed'){
            events.add(new Case_Closed__e(
            CaseNumber__c = cs.CaseNumber,
            ClosedBy__c = Userinfo.getUserName(),
            Subject__c = cs.Subject
            ));
        }
    }
    
    if(!events.isEmpty()){
        EventBus.publish(events); 
    }
}