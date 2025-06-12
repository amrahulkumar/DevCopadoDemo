public with sharing class accountDateUpdateAsync {

    @future
    public static void updateAccountDeadLineDate(){
        List<Account> accList = [SELECT Id,Deadline_Date__c FROM Account WHERE Deadline_Date__c = null];
            for(Account acc:accList){
                    DateTime dt = System.now();
                    acc.Deadline_Date__c = dt.date();                  
            }
            update accList;
    }
}