public class MyApexClass {
    @future(callout=true)
    public static void myFutureMethod(Set<Id> recordIds) {
        List<String> recordNames = new List<String>();
        for (Id recordId : recordIds) {
            recordNames.add('Account ' + recordId);
        }
        
        String jsonBody = JSON.serialize(recordNames);
                system.debug('**********Created JSON*************' + jsonBody);
        
        // Make an HTTP callout with the JSON payload
/*        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://example.com/api/accounts');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(jsonBody); */
        
  /*      Http http = new Http();
        HttpResponse response = http.send(request);
        System.debug('HTTP response status: ' + response.getStatus()); */
    }
}