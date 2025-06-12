trigger SendClosedWonEmail on Opportunity (after update) {
    
        /** collect the opportunity ids **/
        set<id> oppIds = new set<id>();
        for(opportunity opp : Trigger.new){
            if(opp.StageName == 'Closed Won' && Trigger.oldMap.get(opp.Id).stageName != 'Closed Won'){
              oppIds.add(opp.Id);
            }
        }
    
    
        /** Query and Get the owner ids from opportunity **/
        List<opportunity> oppwithOwner = [select id,Name,OwnerId from Opportunity where id IN : oppIds];
    
        Set<id> ownerids = new set<id>();
        for(opportunity opp : oppwithOwner){
            if(opp.OwnerId != null){
                ownerids.add(opp.OwnerId);
            }
            
        }
        
    
        /** Get the ownerids from user object **/
        Map<id,user> ownerMap = new Map<id,user>([select id,email from user where id IN : ownerids]);
        //List<user> emailIds = [select id,email from user where id IN : ownerids];

        /** initiate singleMessage class **/
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        
        for(Opportunity opp : oppwithOwner){
            user owner = ownerMap.get(opp.OwnerId);
                
            if(owner != null && owner.Email != null) {
               Messaging.SingleEmailMessage email = New Messaging.SingleEmailMessage();
               email.setSubject('Lead Grabbed');
               email.SetToaddresses(new string[] {owner.email});
               email.setPlainTextBody('Lead Won, Congratulations');
               emails.add(email);               
            }
            
        }
    
        if( !emails.Isempty()){
            Messaging.sendEmail(emails);
        }
    
}