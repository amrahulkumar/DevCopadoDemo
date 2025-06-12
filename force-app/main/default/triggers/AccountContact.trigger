trigger AccountContact on Account (after insert) {    
    AccountTriggerHandler.accountContact(Trigger.new);
}