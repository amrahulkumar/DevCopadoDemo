({

    doInit : function( component, event, helper ) {
        
        var recievedregion = 'APAC';
        helper.getAllforAPAC(component,event); 
        
        var selectedCountries = component.get("v.countries");
        var selectedAgents = component.get("v.selectedAgents");
        var totalagents = component.get("v.totalagents");
        
        
        if ( selectedAgents == '') {           
            component.set("v.conagentSelMessage",'true');
        }
        else if (totalagents < 30 ) {
            component.set("v.lessthanthirtyagents",'true');
        }

        else if (selectedAgents.includes(0) == true ) {
                component.set("v.zeroornegativeagents",'true');
            } 
         
        component.set('v.validate', function() { 
            if ( component.get("v.selectedAgents") == "" ||  component.get("v.totalagents") < 30) {
                return {
                    isValid: false, 
                    errorMessage: '' 
                }
            }
        });

   
        if (selectedCountries.length > 0 ){
            
            window.setTimeout(
                $A.getCallback(function() {
                    //component.set("v.visible", true);
                    helper.checkBoxTest(component,event); 
                }), 2000 //1000=1 second ; Here delay 2 seconds added
            );
        }
        
		component.set("v.reservedCountries",selectedCountries ); 
        component.set("v.reservedAgents",selectedAgents ); 
        
    },
    

    
    
    getRegionSpecficCountries : function myFunction( component, event, helper) {
                
        var input, filter, table, tr, td, i;
        
        input = document.getElementById("mylist");
        filter = input.value.toUpperCase();
        
        if (filter == 'ALL') {
            $A.enqueueAction(component.get('c.doInit'));
        }
        
        table = document.getElementById("myTable");      
        
        tr = table.getElementsByTagName("tr");
        
        
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[3];
                        
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }       
        }      
    },
    

    
    searchGivenString : function( component, event, helper ) {
       
        var recievedregion= component.find('searchKey').get('v.value');
        var data = component.get("v.baseurllist");  
       	var allData = component.get("v.allData");
        var regionColl =  component.find('searchKey').get('v.value');
        var searchKey = component.get("v.filter"); 
        alert(searchKey);
        if(data!=undefined || data.length>0){  
            // filter method create a new array tha pass the test (provided as function)  
            var filtereddata = allData.filter(word => (!searchKey) || word.Country__c.toLowerCase().indexOf(searchKey.toLowerCase()) > -1);  
            console.log('** '+filtereddata);  
            
        }  
        // set new filtered array value to data showing in the table.  
        component.set("v.baseurllist", filtereddata);  
        var a=component.get("v.countries");
        alert('after search' + a);
        // check if searchKey is blank  
        if(searchKey==''){  
            // set unfiltered data to data in the table.  
            component.set("v.baseurllist",component.get("v.allData")); 
            var a=component.get("v.countries");
            //alert('empty search key' + a);
            component.set("v.selectedcountries",a);
        }     
        
        
        
    },
    
    searchTable : function myFunction1() {
        
        var input, filter, table, tr, td, i, txtValue;
        
        input = document.getElementById("myInput1");
        filter = input.value.toUpperCase();
        
        table = document.getElementById("myTable");
		        
        tr = table.getElementsByTagName("tr");

        
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1];
            if (td) {
                txtValue = td.textContent || td.innerText;
                console.log('###-- txtValue is --###'+ txtValue);
                console.log('###-- filtered is --###'+ txtValue.toUpperCase().indexOf(filter));
                if (txtValue.toUpperCase().indexOf(filter) > -1 && (txtValue.toUpperCase().indexOf(filter) == 3 || txtValue.toUpperCase().indexOf(filter) == 0)) {
                    tr[i].style.display = "";
                    
                } else {
                    tr[i].style.display = "none";
                     
                }
            }       
        }
    },
    
  
    captureAgents : function(component,event,helper) {
        
        
        var selectedCountries = [];
        var checkvalue = component.find("checkRegion");
        var selagents = [];
        var chckvagtval = component.find("input");
        var capturedregions = [];
        var checkregions = component.find("regions");
        let defaultVal = 0;
        let sum= 0; 
  
        var selectedHeaderCheck = event.getSource().get("v.value");
        var table = document.getElementById("myTable"); 
        var td = document.getElementsByTagName('td');
        var tr = table.getElementsByTagName("tr");          
        var selectedHeaderCheck = event.getSource().get("v.value");
        
        
        
        if(!Array.isArray(checkvalue)){
            if (checkvalue.get("v.value") == true) {
            }
        }else{
            for (var i = 0; i < checkvalue.length; i++) { 
                
                if ((chckvagtval[i].get("v.value") == null) || (chckvagtval[i].get("v.value") !== "")) {
                    
                    var x = checkvalue[i].get("v.text");
                    let y = chckvagtval[i].get("v.value");
                    
                    var my = i+1;
                    var ky = (4*my -1);
                    
                    if (chckvagtval[i].get("v.value") < 1 ) {
                        alert ('Given number of agents value is invalid number for country : '+ checkvalue[i].get("v.text"));
                        chckvagtval[i].set("v.value","");
                        break;
                    }
                    
                    
                   if (chckvagtval[i].get("v.value") == "")   {
                       if (selagents.length < 1 ) {
                           component.set("v.conagentSelMessage", true); 
                       }
                    }
                    else { 
                       component.set("v.conagentSelMessage", false);
                    } 
                    
                    defaultVal = parseInt(defaultVal) + parseInt(chckvagtval[i].get("v.value"));
                    selagents.push(chckvagtval[i].get("v.value"));
                    selectedCountries.push(checkvalue[i].get("v.text"));
                    capturedregions.push(document.getElementsByTagName('td')[ky].innerText);
                    
                	}
			
            }            
            
        } 

        component.set("v.selectedAgents", selagents);
        component.set("v.totalagents",defaultVal);
        component.set("v.countries", selectedCountries);
        component.set("v.reservedRegions",capturedregions);
        component.set("v.agentregions",capturedregions); 
        
        console.log('Agent values are--' +selagents);
        console.log('Total agents are--' +defaultVal);
        console.log('Country values are--' + selectedCountries);
       	console.log('Region values are --' +capturedregions);
        
    },

})