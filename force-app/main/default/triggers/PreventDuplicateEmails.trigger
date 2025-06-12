trigger PreventDuplicateEmails on Contact (before insert, before update) {
    
    /** collecting the account ids to be checked **/
    set<id> accountids = new set<id>();
    for(contact c : Trigger.new){
        if(c.AccountId != null){
            accountids.add(c.AccountId);
        }
    }    
    
    /** creating map of emails,account ids having releated contacts **/
    Map<id,Set<String>> existingEmails = new Map<id,Set<String>>();
    
    for(contact c : [select AccountId,email from contact where AccountId IN :accountids ]){
        if(!existingEmails.containsKey(c.AccountId)){
           existingEmails.put(c.AccountId,new Set<String>()); 
        }        
        existingEmails.get(c.AccountId).add(c.Email?.toLowerCase());
    }
    
    /** verify the given email with the list of emails collected from related conatcts**/
    for(contact c : Trigger.new){
        if(c.AccountId !=null && c.Email !=null){
            Set<String> emails = existingEmails.get(c.AccountId);
            if(emails !=null && emails.contains(c.Email.toLowerCase())){
                c.addError('Same emails is already associated with a contact');
            }
        }
    }

}