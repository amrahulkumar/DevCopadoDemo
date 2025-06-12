public class Outbound_Email_4 {
    public void invoke(){
        //Fetch the document and create email File Attachment
        Document d = [select Name,Body,ContentType from Document where name ='Test Doc'];
        Messaging.EmailFileAttachment eft1 = new Messaging.EmailFileAttachment();
        eft1.setBody(d.body);
        eft1.setFileName(d.name);
        eft1.setContentType(d.ContentType);
        
        //Convert the VF page and create EmailfileAttchement
        PageReference p = Page.Test_Page;
        Blob body=p.getContentAsPDF();
        Messaging.EmailFileAttachment eft2 = new Messaging.EmailFileAttachment();
        eft2.setFileName('InvoicePage.pdf');
        eft2.setBody(body);
        //eft2.setContentType('pdf');              
        Messaging.EmailFileAttachment[] files = new Messaging.EmailFileAttachment[]{eft1,eft2};
        
        EmailTemplate et = [select id from EmailTemplate where name = 'Account Confirmation'];//fetch the contact to whom you wnat yo send this email       
        
        Contact con = [select id,AccountId from contact where phone='678'];               
        Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
        msg.setTemplateId(et.id);
        msg.setTargetObjectId(con.id);//id of the user,contact, lead to whom we want to send
        msg.setWhatId(con.AccountId);//In case if you pass the contact as targetObjectId then we need to pass the id of the recored whose data need to be used in template    
      	
        msg.SetFileAttachments(files);
        Messaging.Email[] emails = new Messaging.Email[]{msg};
        Messaging.sendEmail(emails);        
        
    }

}