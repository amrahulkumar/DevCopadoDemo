({
   downloadFile : function(component, event, helper) {
       var action = component.get("c.getFileDownloadUrl");
       action.setParams({ contentDocumentId : component.get("v.contentDocumentId") });
       action.setCallback(this, function(response) {
           var state = response.getState();
           if (state === "SUCCESS") {
               var downloadUrl = response.getReturnValue();
               // Open a new window to trigger the download
               window.open(downloadUrl, '_blank');
           } else {
               // Handle error
               console.log('Error: ' + state);
           }
       });
       $A.enqueueAction(action);
   }
})