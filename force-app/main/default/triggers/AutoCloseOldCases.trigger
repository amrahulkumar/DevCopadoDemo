trigger AutoCloseOldCases on Case (before update) {   
    for(case cs : trigger.new){
        case oldCs = Trigger.oldMap.get(cs.Id);
        if(oldCs.Status == 'Escalated' && cs.Status == 'Escalated'){
            Integer daysSinceUpdate = Date.today().daysBetween(cs.LastModifiedDate.date());
            if(daysSinceUpdate < 7){
                cs.Status = 'Closed';
            }
        }
    }
    
}