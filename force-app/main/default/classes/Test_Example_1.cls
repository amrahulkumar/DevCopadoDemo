@isTest
public class Test_Example_1 {
	@isTest
    static void testMe(){
    Apex_Example_1 ae = new Apex_Example_1();
    ae.callMe();
    System.assertEquals('rahul',ae.name);
    System.assertEquals('hyd',ae.city);
	}
}