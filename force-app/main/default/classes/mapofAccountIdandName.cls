// Class to return the Map of Accountid and Account Name

public class mapofAccountIdandName {   
    public static map<id,string> getAccountMap(){
        map<id,string> accMap = new map<id,string>();
        List<account> acclst = [select id,name from account limit 5];
        for(account acc : acclst){
            accMap.put(acc.id,acc.Name);
        }
        return accMap;
    }
}