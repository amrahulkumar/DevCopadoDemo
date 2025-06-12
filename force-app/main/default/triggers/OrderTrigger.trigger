trigger OrderTrigger on LeadConversionLog__c (after update) {
	OrderTriggerHandler.handleAfterUpdate(Trigger.new);
}