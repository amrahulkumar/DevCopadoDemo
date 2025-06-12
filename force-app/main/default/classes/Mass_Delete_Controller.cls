public class Mass_Delete_Controller {
    public List<Account> accounts {set;get;}
    public Mass_Delete_Controller(Apexpages.StandardSetController controller){
        String[] fields = new String[]{'Name','Phone','Industry','Rating'};
            controller.addFields(fields);
        	accounts = (List<Account>)controller.getSelected();
    }
    Public PageReference invoke(){
        Database.delete(accounts,false);
        PageReference p=new PageReference('/001/o');
        return p;
    }
}