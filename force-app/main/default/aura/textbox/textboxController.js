({
    doInit : function(component, event, helper) {
        
        let inputNumber = prompt('Please enter no. of inputs');
        let keywords = [];
        for(var i=0; i<inputNumber; i++){
            keywords.push({id:i, value:""});
            console.log({id:i, value:""});
        };
        component.set("v.keywords",keywords);
        
    },
    
    auscapturesitenames : function(component, event, helper) {
        var x = component.find("ausconnecttype").get("v.checked");
        console.log('Internet --' + x );
    }
})