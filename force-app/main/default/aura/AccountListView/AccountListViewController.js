({
    doinit : function(component, event, helper) {
        var listView = component.find("listView");
        var records = listView.get("v.data");
        console.log('records ' + records);
     //   var recordsCount = records.length;
      //  console.log('Total Records: ' + recordsCount);
    }
})