({
    onHeaderChange : function(component, event, helper) {
        var selectedField = event.target.id;
        var selectedValue = event.getSource().get("v.value");
        console.log(selectedValue + ' is selected for field :: ' + selectedField);
    }
})