public class Apex_Example_6 {
    public void create(){
        Opportunity op = New Opportunity();
        op.Name = 'Apple12';
        op.StageName = 'Prospecting';
        op.CloseDate = System.today()+15;
        insert op;
    }
}