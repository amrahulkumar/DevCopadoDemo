trigger MyAccountTrigger on Account (before insert) {
    List<Account> accountList = Trigger.new;
    List<Id> accountIdList = new List<Id>();
    for (Account a : accountList) {
        accountIdList.add(a.Id);
    }
    MyHttpCalloutClass.makeHttpCallout(accountIdList);
}