//Challenge - Find the opportunity with the highest amount from a list
public class HighOppAmount {
	    public static List<Opportunity> oppswithhighAmount(){
        	List<Opportunity> opp = [select id,Name,Amount from Opportunity where Amount != null ORDER BY Amount DESC LIMIT 1];
        	return opp;
    	}
}