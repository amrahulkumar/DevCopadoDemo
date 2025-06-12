({ 
    doInit: function(component, event, helper) {
        // Initialize the component
        var today = new Date().toISOString().split('T')[0]; // Get today's date in yyyy-mm-dd format
        component.set("v.disabledDates", [today]); // Example: disable today's date
    }
})