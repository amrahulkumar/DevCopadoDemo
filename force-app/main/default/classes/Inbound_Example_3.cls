global class Inbound_Example_3 implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope env){
	Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        try{
            
            Case c = new case();
            c.Subject = email.subject;
            c.Priority = 'Normal';
            c.Status = 'New';
            c.Description = email.plainTextBody;
            c.Origin = 'Email';
            insert c;

             
            List<Attachment> attachments = New List<Attachment>();
            Messaging.InboundEmail.binaryAttachment[] files = email.binaryAttachments;
            for( Messaging.InboundEmail.binaryAttachment b :files){
                    Attachment a = new Attachment();
                    a.ParentId = c.Id;
                    a.body = b.body;
                    a.name = b.filename;
                    attachments.add(a);
        		}
                insert attachments;
                
                result.success = true;
            }catch(Exception e){
                result.success=false; 
            }       
     return result;    
	}
}