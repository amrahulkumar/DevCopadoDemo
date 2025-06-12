public class ErrorEmailService {
    
    public static void sendErrorNotification(String errorMessage) {
        
        
        // Set up email parameters
        String orgId = UserInfo.getOrganizationId();
        String recipientEmail = 'rahul.yerragunta@gmail.com';
        String subject = orgId + ' -- Error Notification';
        String body = 'An exception occurred:\n\n' + errorMessage;



        // Create an instance of the SingleEmailMessage class
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new List<String>{recipientEmail});
        email.setSubject(subject);
        email.setPlainTextBody(body);

        // Send the email
        Messaging.SendEmailResult[] sendResults = Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
        
        // Check if the email was sent successfully
        if (sendResults[0].isSuccess()) {
            System.debug('Error notification email sent successfully');
        } else {
            // Handle any errors during email sending
            System.debug('Error sending notification email: ' + sendResults[0].getErrors()[0].getMessage());
        }
    } 
}