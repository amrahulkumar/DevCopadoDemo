trigger RecursionGuard on Contact (before insert,after update) {
    
    if (Trigger.isInsert){
		ContactTriggerHandler.beforeinsertHandler(Trigger.new);
    }
    
    if(Trigger.isUpdate){
		ContactTriggerHandler.afterUpdateHandler(Trigger.new);
    }

}