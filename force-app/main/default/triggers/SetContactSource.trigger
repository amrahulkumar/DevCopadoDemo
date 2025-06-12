trigger SetContactSource on Contact (before insert, before update) {
    for (contact con : Trigger.new) {
        if(String.IsBlank(con.leadsource)){
            con.leadsource = 'Web';
        }
    }
}