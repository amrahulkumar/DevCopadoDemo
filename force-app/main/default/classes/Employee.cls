public class Employee {
    
    String name;
    Integer age;
    String designation;
    double salary;
    
    // This is constructor of Employee Class
    public  Employee (String name) {
        this.name = name;
    }
    
    //Assign age of employee to the variable age.
    public void empAge(integer empAge){
        age = empAge;
    }
    
    //Assign designation to the variable designation.
    public void empDesignation(String empDesignation){
        designation = empDesignation;
    }	
    
    //Assign age of employee to the variable age.
    public void empSalary(double empSalary){
        salary = empSalary;
    }
    
    //Print the employee details
    
    public void printEmployee(){
        System.debug('Name ' + name );
        System.debug('Name ' + age );
        System.debug('Name ' + designation );
        System.debug('Name ' + salary );
        
    }
    
}