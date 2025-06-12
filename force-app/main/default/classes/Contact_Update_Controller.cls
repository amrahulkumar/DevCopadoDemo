public class Contact_Update_Controller {
    public Account acc{set;get;}
    public List<Contact> contacts {set;get;}
    public Contact_Update_Controller(Apexpages.StandardController controller){
        //controller will return only id of the record,if you want any other fields other than id
        //we need to add those fields to controller
        String[] fields = new String[]{'Name','Phone','Industry','Rating'};
        controller.addFields(fields);
        acc = (Account)controller.getRecord();
        //Get the contacts of those account which is referred as controller
        contacts =[select id,firstname,lastname,phone,Email from Contact where accountId=:acc.Id];
    }
	
    public PageReference invoke(){
        List<Messaging.SingleEmailMessage> emails = New List<Messaging.SingleEmailMessage>();
        for(Contact c:contacts){
            Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
            String[] toadd=new String[]{c.email};
            String body = 'Dear '+ c.firstname;
            body=body+'<br/> Update your contact details <br/>';
            body=body+'Email:'+c.email+'<br/> Phone:'+c.phone+'<br/> Thanks <br/> Sales Team';
            msg.setSubject('Update Contact Details');
            msg.setHtmlBody(body);
            msg.setToAddresses(toadd);
           	emails.add(msg);  
        }
        Messaging.sendEmail(emails);
        PageReference p=new PageReference('/'+acc.Id);
        return p;
    }
}