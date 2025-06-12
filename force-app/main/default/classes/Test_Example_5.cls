@isTest
public class Test_Example_5 {
		@isTest
        static void CallMe(){
        Apex_Example_5 con = new Apex_Example_5();
        con.lastname='Robert';
        con.firstname='Williams';
        con.phone='67891';
        con.create();
        integer count = [select count() from contact where lastname=:con.lastname and firstname=:con.firstname ];
    } 
}