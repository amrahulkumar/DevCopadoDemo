({
    fetchData: function (component,event,helper) {
        var action = component.get("c.getOpportunitys");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var data = response.getReturnValue();
                component.set('v.data',data);
            }
        });
        $A.enqueueAction(action);
    },
    showSuccessToast: function(component,event,helper,type,message){
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "type": type,
            "message": message
        });
        toastEvent.fire();
    }
})