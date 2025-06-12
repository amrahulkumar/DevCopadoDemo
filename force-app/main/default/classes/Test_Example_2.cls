@isTest
public class Test_Example_2 {
	@isTest
    Static void testMe(){
        Apex_Example_2 ae = new Apex_Example_2();
        ae.callMe();
        System.assertEquals('Banking',ae.industry);
        System.assertEquals('Hot',ae.rating);
        System.assertEquals('Public',ae.ownership);
    }
}