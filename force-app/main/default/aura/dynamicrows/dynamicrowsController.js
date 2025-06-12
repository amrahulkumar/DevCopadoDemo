({
	doInit : function(component, event, helper) {
        
        component.set('v.fileShares', {'label': 'Enter Path', 'value': '','id': 'fileShare1'});
		
	},
    
    addMoreShareHandler : function(component, event, helper){
        var inputs = component.get("v.fileShares");
        var id = inputs.length+1;
        var obj = {
            'label': '',
            'value': '',
            'id': 'fileShare'+id}
        inputs.push(obj);
        component.set("v.fileShares", inputs);
    },
    
    removeShareHandler : function(component, event, helper){
		event.preventDefault();
		var selectedItem = event.currentTarget;
                var idtoremove = selectedItem.dataset.idtoremove;
		var inputs = component.get("v.fileShares");
		for(var i=0;i<inputs.length;i++){
			var obj = inputs[i];
			if(obj.id == idtoremove){
				inputs.splice(i,1)
			}
		}
		component.set("v.fileShares", inputs);
	}
})