({

    doInit : function( component, event, helper ) {

        helper.getAllforAPAC(component,event); 
                
        var selorgcons  	=  component.get('v.selectedorgincons');
        var seltollfree 	=  component.get('v.selectedtollfree');
        var selsharedcost   =  component.get('v.selectedsharedcost');
        var selpstn 		=  component.get('v.selectedpstn'); 
        
        console.log('do int ** restor' + selorgcons);
        
        
  /*      if ( selectedAgents == '') {           
            component.set("v.conagentSelMessage",'false');
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
        }); */


		console.log('restor length' + selorgcons.length);
        
        if (selorgcons.length > 0 ){
            
            window.setTimeout(
                $A.getCallback(function() {
                    //component.set("v.visible", true);
                    helper.checkBoxTest(component,event); 
                }), 2000 //1000=1 second ; Here delay 2 seconds added
            );
        }
        
	/*	component.set("v.reservedCountries",selectedCountries ); 
        component.set("v.reservedAgents",selectedAgents ); */
        
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
            td = tr[i].getElementsByTagName("td")[2];       
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
        
        var master = component.find("master");
        var regions = component.find("regions");
        var country = component.find("country");
        var tollfreeyes = component.find("tollfreeyes");
        var sharedcostyes = component.find("sharedcostyes");
        var pstnyes = component.find("pstnyes");
        var tollfreeid = component.find("tollfreeid");
        var sharedcostid = component.find("sharedcostid");
        var pstnid = component.find("pstnid");
        var SharedCostyes = component.find("SharedCostyes");
        var PSTNyes = component.find("PSTNyes");
        
        var masterlst = [];
        var regionslst = [];
        var tollfreeyeslst = [];
        var sharedcostyeslst = [];
        var pstnyeslst = [];
        var conlst = [];
        var tollfree = [];
        var sharedcost = [];
        var pstn = [];
        var totalcoll = [];

  
        var selectedHeaderCheck = event.getSource().get("v.value");
        var table = document.getElementById("myTable"); 
        var td = document.getElementsByTagName('td');
        var tr = table.getElementsByTagName("tr");          
        var selectedHeaderCheck = event.getSource().get("v.value");
        
        
        
        if(!Array.isArray(master)){
            if (master.get("v.value") == true) {
            }
        }else{
            for (var i = 0; i < master.length; i++) { 
                
                var ky = (6*i +2);
                var kz = (6*i +1);


             		   tollfree.push(tollfreeyes[i].get("v.value"))
               		   sharedcost.push(SharedCostyes[i].get("v.value"))
                       pstn.push(PSTNyes[i].get("v.value")) 
                        
                        if (tollfreeyes[i].get("v.value") == true) {
                            totalcoll.push(tollfreeid[i].get("v.value"))                            
                        }
               		
                
                        if (SharedCostyes[i].get("v.value") == true) {
                            totalcoll.push(sharedcostid[i].get("v.value"))                            
                        }
                
                        if (PSTNyes[i].get("v.value") == true) {
                            totalcoll.push(pstnid[i].get("v.value"))                            
                        } 

                    
                
                	 if ((tollfreeyes[i].get("v.value") == true) || (SharedCostyes[i].get("v.value") == true) ||
                         (PSTNyes[i].get("v.value") == true)) {
                         
                           conlst.push(component.find("master")[i].get("v.text"));
                           regionslst.push(document.getElementsByTagName('td')[ky].innerText);
                         }
                    
                	
                    }

        } 
        

        
        component.set('v.selectedtollfree',tollfree);
        component.set('v.selectedsharedcost',sharedcost);
        component.set('v.selectedpstn',pstn);
        component.set('v.selectedregion',regionslst);
        component.set('v.selectedorgincons',conlst);
        component.set('v.selectedcountriesid',totalcoll);
      
  
        console.log('Country values are--' + conlst);
        console.log('Region values are--' + regionslst);        
        console.log('Tollfree 2nd page Id values are--' + tollfree);
        console.log('SharedCost 2nd page Id values are--' + sharedcost);
        console.log('PSTN 2nd page Id values are--' + pstn);
        console.log('All 2nd page Id values are--' + totalcoll);
        
       // helper.getmasterlabels(component,event);
    
        /***** cookie logic ***/
        helper.saveCookie(component,event);
        
    },


})