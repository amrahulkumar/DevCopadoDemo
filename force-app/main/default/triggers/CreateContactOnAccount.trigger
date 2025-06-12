trigger CreateContactOnAccount on Account (after insert) {
	List<Contact> newContacts = new List<Contact>();
    for(Account acc : Trigger.new){
        newCOntacts.add(new Contact(LastName = acc.Name + 'Contact',AccountId = acc.Id));
    }
    insert newCOntacts;
}