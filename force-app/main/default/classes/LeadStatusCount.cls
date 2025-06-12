//Create a method that returns a Map<string,integer> to count how many leads exist for each lead status

public class LeadStatusCount {
    
  /*  public static Map<string,integer> countLeads(List<id> leadIds){       
        Map<string,integer> resultMap = new Map<string,integer>();
        List<lead> leads = [select id,name,status  from lead where id IN:leadIds ];
        
        for(lead ld : leads){
            if(resultMap.containsKey(ld.Status)){
                resultMap.put(ld.Status,resultMap.get(ld.Status)+1 );
            }
            else{
                resultMap.put(ld.Status,1 );
            }
        }
        system.debug('***' + resultMap);
        return resultMap;
    } */
    
    
    //Another way
    public static map<string,integer> countLeadsusingagg(){
        Map<string,integer> resultMap = new Map<string,integer>();
        for( AggregateResult ar : [select status,count(id) total from lead group by status]){
            String status = (string) ar.get('status');
            Integer counted = (integer) ar.get('total');
            resultMap.put(status,counted);
        }
      system.debug('***' + resultMap );
      return  resultMap;
    }

}