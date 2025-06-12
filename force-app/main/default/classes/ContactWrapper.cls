//Create a wrapper for a Contact and a Boolean isSelected field

public class ContactWrapper {
    
    public Contact contact{get;set;}
    public Boolean isSelected{get;set;}
    
    public ContactWrapper(Contact c){
        this.contact = c;
        this.isSelected = false;
        
    }
}