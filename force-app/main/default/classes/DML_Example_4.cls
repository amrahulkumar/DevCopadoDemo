public class DML_Example_4 {
    public void create(){
        SavePoint sp = Database.setSavepoint();
        try{
            Account acc = New Account();
            acc.Name = 'TCS';
            acc.Phone = '757';
            acc.Industry = 'Banking';
			insert acc;
			contact con = new Contact();
			con.FirstName = 'Kates';
			con.Phone = '5456464';
            insert con;
        }catch(Exception e){
            Database.rollback(sp);
            System.debug('Rolled Back');
           
        }
    }

}