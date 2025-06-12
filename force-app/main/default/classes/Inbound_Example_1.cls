global class Inbound_Example_1 implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope env){
	Messaging.InboundEmailResult result = New Messaging.InboundEmailResult();
    try{
        String fromadd=email.fromAddress;
        String subject=email.subject;
        String body=email.plainTextBody;
        Contact con=[select id from Contact where email=:fromAdd limit 1];
        Case c = new Case();
        c.Subject = subject;
        c.Priority = 'Normal';
        c.Status = 'New';
        c.Origin = 'Email';
        c.Description =body;
        c.ContactId = con.Id;
        insert c;
        result.success=true;       
    }catch(Exception e){
        result.success=false;
    }
    return result;    
  }
}