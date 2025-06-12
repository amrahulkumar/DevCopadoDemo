trigger SetAccountRating on Account (before insert, before update) {
    for (Account acc : Trigger.new){
        if(Trigger.IsInsert && String.IsBlank(acc.Rating)){
            acc.Rating = 'Hot';
            acc.Indian__c = true;
        }
        if(Trigger.IsUpdate && String.IsBlank(acc.Rating)){
            acc.Rating = 'Cold';
            acc.Indian__c = false;
        }
    }
}