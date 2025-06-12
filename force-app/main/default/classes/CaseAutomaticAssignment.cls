public class CaseAutomaticAssignment {
    public static void autoassignCases(List<case> cases){
        id supportQueueId = [select id from Group where name = 'Billing Suport' LIMIT 1].Id;
        for(Case cs : cases){
            if(cs.Priority == 'High'){
                cs.OwnerId = supportQueueId;
            }
        }
    }
}