public with sharing class AccountContacts {
    public AccountContacts() {
        List<contact> contactList = new List<Contact>();
        Contact contactObject;
        for (Account accountIterator : [select Id,Name from Account LIMIT 150])
        {
            contactObject = new Contact();
            contactObject.AccountId = accountIterator.Id;
            contactObject.LastName = 'Demo' + accountIterator.Name;
            contactList.add(contactObject);
        }
        if(contactList.size() > 0){
            insert contactList;
        }
        system.debug('Size of contact list' + contactList.size());
        system.debug('Count of DML Statements' + Integer.valueOf(Limits.getDmlStatements()));
    }
}