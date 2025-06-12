trigger CaseNotifyTrigger on Case (after insert) {
    List<id> highPriorityCases = new List<id>();
    for(case cs : trigger.new){
        if(cs.Priority == 'High'){
            highPriorityCases.add(cs.Id);
        }
    }
    
    if(!highPriorityCases.isEmpty()){
        CaseNotifier.sendNotificationAsync(highPriorityCases);
    }
}