//Class to get all closed won opportunities this month

public class closedOpportunities {
    
    public static list<opportunity> thismonthclosedOpps(){
        list<opportunity> closedWonOpps = [select id,name,StageName from opportunity where StageName = 'Closed Won' AND CloseDate = LAST_N_MONTHS:1];
    	system.debug('**closedWonOpps**' + closedWonOpps);
        system.debug('**closedWonOpps count**' + closedWonOpps.size());
        return closedWonOpps;
    }

}