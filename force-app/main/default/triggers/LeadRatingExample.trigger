trigger LeadRatingExample on Lead (before insert) {
    List<Lead> leads = trigger.new;
    for (lead l:leads){
        l.Rating = 'Warm';
        l.leadsource = 'Email';
        l.Description = 'Apex trigger is setting rating, leadsource values using trigger.new method, before insert';       
    }

}