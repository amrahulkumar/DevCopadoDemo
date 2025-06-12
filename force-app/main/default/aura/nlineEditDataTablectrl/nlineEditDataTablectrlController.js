({
    doInit: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'Id', fieldName: 'Id', type: 'text' , editable: false},
            {label: 'Name', fieldName: 'Name', type: 'text' ,editable: true},
            {label: 'Amount', fieldName: 'Amount', type: 'currency' ,editable: true},
            {label: 'Close Date', fieldName: 'CloseDate', type: 'date-local' ,editable: true}
        ]);
        //helper.DoNothing(component,event, helper);
    },
    handleSave: function (component, event, helper) {
        var draftValues = event.getParam('draftValues');
        var action = component.get("c.updateOppotunitys");
        action.setParams({"oppList" : draftValues});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var data = response.getReturnValue();
                if(data === true){
                    helper.showSuccessToast(component,event, helper, 'success','record updated successfully');
                    $A.get('e.force:refreshView').fire();
                }else{
                    helper.showSuccessToast(component,event, helper, 'error','please try again')
                }
            }
        });
        $A.enqueueAction(action);
    },
})