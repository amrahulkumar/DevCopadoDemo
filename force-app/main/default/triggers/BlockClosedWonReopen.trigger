trigger BlockClosedWonReopen on Opportunity (before update) {
    for(Opportunity newopp : trigger.new){
        Opportunity oldOpp = Trigger.oldMap.get(newopp.Id);
        if(oldOpp.StageName == 'Closed Won' && newopp.StageName != 'Closed Won'){
            newopp.StageName.addError('you cannot reopen the closed opportunity');
        }
    }
}