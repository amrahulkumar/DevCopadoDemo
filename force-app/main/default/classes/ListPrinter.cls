public class ListPrinter {
	
    public static void printList(List<String> names){
        for(String name : names){
            system.debug('***' + name);
        }
        
        /** find the index of given word using contains and remove 
        if(names.contains('rahul')){
            names.remove(names.indexOf('rahul'));
        }
        
        /** if multiple occurences find and remove**/
        for (integer i= names.size()-1; i>=0; i--){  
            if(names[i] == 'rahul'){
                names.remove(i);
            }
            
        /**Clear the List**/    
            names.clear();
        }        
    }

}