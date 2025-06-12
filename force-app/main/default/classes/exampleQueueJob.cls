public with sharing class exampleQueueJob implements Queueable {
        public void execute(QueueableContext context) {
            System.debug('Execute Queueable');
            List<Account> acc = [SELECT Id, Name FROM Account];
             for(Account ac : acc){
                ac.Description = 'Updated by exampleQueueJob';
             }
             update acc;
        }
}