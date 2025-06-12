trigger LeadExample2 on lead (before insert) {
    list<lead> leads = Trigger.new;
    for (lead l:leads){
        if (l.Industry == 'Banking') {
            l.Rating = 'Hot';
            l.LeadSource = 'Web';
        }
        else {
            l.Rating = 'Warm';
            l.LeadSource = 'Email';
        }

    }

}