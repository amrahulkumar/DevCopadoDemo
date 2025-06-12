public class Outbound_Email_3 {
    public void invoke(){
        //get the email template which you want to send as body
        EmailTemplate et = [select id from EmailTemplate where name='Account Confirmation'];
        //fetch the contact to whom you want to send this email
        Contact con = [select id,AccountId from Contact where phone='456'];
        Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
        msg.setTemplateId(et.id);// Id of the user,contact,lead to whom we want to send
        msg.setTargetObjectId(con.id);// In case if you pass the contact as targetObjectId then we need
        							// to pass the id of the record whose data need to be used in template
        Messaging.Email[] emails = new Messaging.Email[]{msg};
        Messaging.sendEmail(emails);                     
    }
    public void callMe(){
        Lead my = [select id from lead where phone = '456'];
        EmailTemplate et = [select id from EmailTemplate where name ='Lead Ack'];
        Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
        msg.setTemplateId(et.id);
        msg.setTargetObjectId(my.id);
        Messaging.Email[] emails = new Messaging.Email[]{msg};
        Messaging.sendEmail(emails);   
    }
    //Write a query to fetch all the leads created today and send email with the body as updated_details template
    public void show(){
        EmailTemplate et = [select id from EmailTemplate where name ='Update_Details'];
        Map<id,Lead> leads = new Map<id,Lead>([select id,lastname  from lead where createdDate = TODAY]);
        List<id> leadids = new List<id>(leads.keySet()); //Keyset() : This will return you leadids
        Messaging.MassEmailMessage msg = new Messaging.MassEmailMessage();
        msg.setTemplateId(et.id);
        msg.setTargetObjectIds(leadids);
        Messaging.Email[] emails = new Messaging.Email[]{msg};
        Messaging.sendEmail(emails);
    }
}