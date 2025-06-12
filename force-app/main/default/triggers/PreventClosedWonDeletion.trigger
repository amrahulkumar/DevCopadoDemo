trigger PreventClosedWonDeletion on Opportunity (before delete) {
    OpportunityHandler.checkOpportunityStatus(trigger.old);
}