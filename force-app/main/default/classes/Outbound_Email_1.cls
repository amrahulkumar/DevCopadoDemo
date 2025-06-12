public class Outbound_Email_1 {
    public void invoke(){
        
        
        String[] toadd = new String[]{'rudra.lasya1@gmail.com'};
        String[] bcadd = new String[]{'thisisbccaddress@gmail.com'};
        String[] ccadd = new String[]{'thisisccaddress@gmail.com'};
            
        Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
        msg.setToAddresses(toadd);
        //msg.setToBccAddress(bcadd);
        //msg.setCcAddresses(ccadd);
        msg.setSubject('This is email generated from Salesforce Outbound_Email_1 Class');
        msg.setPLainTextBody('This is test email sent using apex class');
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(toadd);
        mail.setSubject('HTML Body Text Message');
        String body = '<h2> Dear Customer, <h2/>';
        body = 'Your request is recieved with the following details <br/>';
        body = body+'Name:<i> Rahul Kumar </i>';
        body = body+'Phone:<i> 8446197936 </i>';
        mail.setHTMLBody(body);
        mail.setSenderDisplayName('Developer-Rahul');
        mail.setInReplyto('yrahul2rahul@gmail.com');
		mail.setInReplyto('yrahul2rahul@gmail.com');    
        
        Messaging.Email[] emails = new Messaging.Email[]{msg,mail};
        Messaging.sendEmail(emails);
        
    }

}