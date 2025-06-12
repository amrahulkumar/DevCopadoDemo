public class OpportunityCloner {
    public static Opportunity OpportunityClone(id oppId){
        Opportunity originalOpp = [select Name,StageName,CloseDate,AccountId from Opportunity where id=:oppId ];
        Opportunity newOpp = originalOpp.clone(false,true,false,false);
        insert newOpp;
        
        
        List<OpportunityLineItem> originalItems = [select Quantity,PricebookEntryId,UnitPrice from OpportunityLineItem where OpportunityId =:oppId];
        List<OpportunityLineItem> newItems = new List<OpportunityLineItem>();
        
        for(OpportunityLineItem item : originalItems){
            OpportunityLineItem newItem = new OpportunityLineItem(
            Quantity = item.Quantity,
            PricebookEntryId = item.PricebookEntryId,
            UnitPrice = item.UnitPrice,
            OpportunityId = newOpp.Id);
            newItems.add(newItem);
        }
        insert newItems;
        return newOpp;
    }
}