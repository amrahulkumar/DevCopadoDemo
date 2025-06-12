public class Opportunity_Handler {
    public void ClosedWonValidation(list<opportunity> LstNewOpty, list<opportunity> LstOldOpty)
    {
        if(LstOldOpty != null){
             for(opportunity NewOpp:LstNewOpty)  {
            	for(opportunity OldOpp:LstOldOpty) {
                        if(NewOpp.id == OldOpp.id) {
                            if(NewOpp.Stagename == 'Closed Won' && OldOpp.StageName != 'Negotiation/Review'){
                                NewOpp.StageName.AddError('You can change Statge Name "Closed Won" only from stage "Negotiation/Review"');
                            }                   
                        }
            	    }
        		}
           }     
    }
   
}