public class Apex_Example_5 {
	public String lastname;
    public String firstname;
    public String Phone;
    public void create(){
        Contact con = new Contact();
        con.LastName = lastname;
        con.FirstName = firstname;
        con.Phone = Phone;
        insert con;
    }
}