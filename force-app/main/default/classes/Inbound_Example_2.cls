global class Inbound_Example_2 implements Messaging.InboundEmailHandler{
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope env){
	Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
    try{
        contact con = new contact();
        con.LastName = email.fromName;
        con.Email = email.fromAddress;
        con.Description = email.plainTextBody;
        insert con;
        result.success = true;
    }
    catch(exception e){
        result.success = false;
    }
        return result;
  }
}