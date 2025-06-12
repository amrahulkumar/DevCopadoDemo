/** On opportunity insert/update presvent save if amount exceeds a threshold limit defined in custom meta data**/
trigger ValidateOpportunityAmount on Opportunity (before insert,before update) {
    
    Decimal maxAmt = 1000;
    List<OpportunityThreshold__mdt> config = new List<OpportunityThreshold__mdt>(
    [select MaxAmount__c from OpportunityThreshold__mdt LIMIT 1 ]);
    
    if(config != null){
        if(!config.IsEmpty()){
            OpportunityThreshold__mdt threshold = config[0];
            if(threshold.MaxAmount__c != null ){
                maxAmt = threshold.MaxAmount__c;
            }
        }
    }
    
    for(Opportunity opp: Trigger.new){
        if(opp.Amount !=null){
            if(opp.Amount > maxAmt){
                opp.addError('Opportunity amount exceeds the threshold configured amount');
            }
        } 
    }
    
}