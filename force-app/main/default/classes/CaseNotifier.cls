public class CaseNotifier {
    
    @future
    public static void sendNotificationAsync(List<Id> caseIds){
        List<case> cases = [select id,casenumber,subject from case where id IN :caseIds];
        for(case cs : cases){
            system.debug('Notifying for the high-priority case:' + cs.CaseNumber);
        }     
    }
}