({
	doInit : function(component, event, helper) {
		
        var monthsvalues = [12,24,36];
        component.set ('v.colors', monthsvalues);
	},
    
    radioresult : function(component, event, helper) {
        
	var result = component.get('v.networkresultvalue');
    alert(result);
        
        
    }
})