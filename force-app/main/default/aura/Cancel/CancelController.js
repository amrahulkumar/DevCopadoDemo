({
    handleClick : function(component, event, helper) {
        var recordId = component.get("v.recordId")
        console.log("***Record ID**" +recordId );
  /*      var flow = component.find("flowData");
        var inputVariables = [
            {
                name: "recordId",
                type: "String",
                value: component.get("v.recordId")
       		 }
         ];
        flow.startFlow("Welcome", inputVariables) */
     var url = './cancel';
	 window.location.href = url;
    }
})