trigger UpdateContactsNoBulk on Account (after update) {
    
    for(Account acc : Trigger.new){
        Account oldAcc = Trigger.oldMap.get(acc.Id);
        if(acc.Phone != oldAcc.Phone) {
            List<Contact> contacts = [select Id,AccountId from Contact where AccountId =:acc.Id];
            for(contact con : contacts) {
                con.Description = 'Phone number is updated.Check the related Account Phone field';
                update con;
            }
        }
        
    }

}