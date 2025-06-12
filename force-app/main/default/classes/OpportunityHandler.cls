public class OpportunityHandler {
    public static void checkOpportunityStatus(List<Opportunity> oppList){
        for(Opportunity opp : oppList){
            if(opp.StageName == 'Closed Won'){
                opp.addError('Opportunity cannot be deleted - Trigger - PreventClosedWonDeletion');
            }
        }
    }
}