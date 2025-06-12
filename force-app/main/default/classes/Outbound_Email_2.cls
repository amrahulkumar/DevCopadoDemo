public class Outbound_Email_2 {
    public void invoke(){
        List<Lead> leads = [select id,lastname,firstname,phone,email from lead where createdDate=TODAY];
        List<Messaging.Email> emails =new List<Messaging.Email>();
        
        For(lead my:Leads){
        
            String[] toadd = new String[]{my.email};
            String body = 'Dear Customer,<br/>';
            body = body+'Your service request is recieved withe the following details<br/>';
            body=body+'<b>Last Name:</b><i>'+my.LastName+'</i><br/>';
            body=body+'<b>First Name:</b><i>'+my.FirstName+'</i><br/>';
            body=body+'<b>Phone:</b><i>'+my.Phone+'</i><br/>';
            body=body+'<b>Email:</b><i>'+my.Email+'</i><br/>';
            body=body+'Thanks <br/>Rahul';
            
            Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
            msg.setToAddresses(toadd);
            msg.setSubject('Lead Acknowledgement');
            msg.setHtmlBody(body);
            msg.setSenderDisplayName('support team');
            emails.add(msg);
            
        }
        
        Messaging.sendEmail(emails);
    }
}