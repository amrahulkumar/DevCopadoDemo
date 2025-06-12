({  
    doInit : function(component, event, helper) {
        var recordId=component.get("v.recordId");
        //Remove hardcoding based on your record
        helper.requestFiledata(component, event, 'ka05g000001b35qAAA','entity');     
    },
    
/* 	getSpecificFile : function(component, event, helper) {
        var recordId=component.get("v.contentdocumentId");
        //Remove hardcoding based on your record
       	helper.requestFiledata(component, event,'0695g00000HuUNuAAN','');
	},
   getCaseFiles : function(component, event, helper) {
    	var recordId=component.get("v.recordId");
       //Remove hardcoding based on your record
    	helper.requestFiledata(component, event, 'ka05g000001b34nAAA','entity'); 
	} */
})