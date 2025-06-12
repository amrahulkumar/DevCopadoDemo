public class Student_List {
    public Student std {set;get;}
    public Student_List(){
        std = new Student();
        std.lastname = 'Kumar';
        std.firstname = 'rahul';
        std.city = 'hyd';
        std.phone = '123';
    }
}