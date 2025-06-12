/** Scenario: If a Contact has a Birthday within the next 7 days, insert a reminder log into a custom object. **/

public class BirthdayReminder {
      
    public static void createReminders(List<contact> contacts){
        List<LeadConversionLog__c> logs = new List<LeadConversionLog__c>();
        for(contact con : [select id,Birthdate,LastName from contact]){
            if(con.Birthdate != null || con.Birthdate >= Date.today() || con.Birthdate <= Date.today()){
                system.debug('***In if block***');
				logs.add(new LeadConversionLog__c (
                    Contact__c = con.Id,
                    LeadName__c = con.LastName,
                    Reminder_Date__c = date.today()
                ));
            }
        }
         system.debug('***contacts fetched ***' + [select id,Birthdate,LastName from contact]);
        system.debug('***logs inserted ***' + logs);
        insert logs;
    }
}