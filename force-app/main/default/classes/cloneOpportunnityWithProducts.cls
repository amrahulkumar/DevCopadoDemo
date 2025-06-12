public class cloneOpportunnityWithProducts {
    
    public static Opportunity cloneOpportunityProducts(Id oppId){
        
        	Opportunity original = [select Name,CloseDate,StageName from Opportunity where id=: oppId];
        	Opportunity cloneOpp = original.clone(false,true,false,false);     
        	insert cloneOpp;
        
        	List<OpportunityLineItem> items = [select Quantity,PricebookEntryId,UnitPrice from OpportunityLineItem where OpportunityId =:oppId ];
        	List<OpportunityLineItem> newItems = new List<OpportunityLineItem>();
        
            for(OpportunityLineItem item : items){
                OpportunityLineItem newItem = item.clone(false);
                system.debug('**newItem**' + newItem);
                newItem.OpportunityId = cloneOpp.Id;
                newItems.add(newItem);
            }
        	insert newItems;       
        return cloneOpp;
    }

}