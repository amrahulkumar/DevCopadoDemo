({
    getAllforAPAC : function(component,event){
        component.set('v.mycolumns', [
            {label: 'Country', fieldName: 'country', type: 'text'},
                {label: 'Agent', fieldName: 'agent', type: 'text'}
                
            ]);
        var selectedRegion = ['APAC','EUROPE','AMERICA','MEA'];
        var exceptcountries = component.get('v.exceptionCountries');
        
	   console.log (exceptcountries);
       component.set("v.worldregions",selectedRegion);
        var action = component.get("c.getAllCountries");
        action.setParams({
            "CountryName": exceptcountries          	
        });
        action.setCallback(this, function(a) {
            component.set("v.baseurllist", a.getReturnValue());
            component.set("v.allData", a.getReturnValue());
        }); 
        $A.enqueueAction(action);
       
        
 /*       let result1 = [{MasterLabel : 'Australia', Tollfree__c: 'true', Shared_cost__c: 'true',PSTN__c: 'true',Flag__c: 'AUSTRALIA',Country__c: 'Australia', Region__c: 'Europe'},
                       {MasterLabel : 'Belgium', Tollfree__c: 'true', Shared_cost__c: 'true',PSTN__c: 'true',Flag__c: 'BELGIUM',Country__c: 'Belgium', Region__c: 'Europe'}] ;
        
        component.set("v.baseurllist", result1);
        component.set("v.allData"  , result1); */
        
        
    },
    
    
    getmasterlabels : function(component,event){
        
        var exceptcountries = component.get('v.selectedcountriesid');        
        console.log (exceptcountries);
        var action = component.get("c.getcountryspecCallType");
        action.setParams({
            "ReqID": exceptcountries          	
        });
        action.setCallback(this, function(a) {
            component.set("v.selconsmasterlabel", console.log(a.getReturnValue()));
        }); 
        $A.enqueueAction(action);
        
    },
    
    


     searchCountry : function(component,event){
        var selectedRegion = component.find('regions').get('v.value'); 
        var givenCountry = component.find('searchKey').get('v.value');
        var action = component.get("c.searchCountries");
        action.setParams({
            "RegionName": selectedRegion,
            "conName" : givenCountry
            
        });
        action.setCallback(this, function(a) {
            component.set("v.baseurllist", a.getReturnValue());
        });
        $A.enqueueAction(action);
    }, 

    
    checkBoxTest : function (component,event) {
        
        console.log('Restore method called');
                
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
       


        var table = document.getElementById("myTable"); 
        var td = document.getElementsByTagName('td');
        var tr = table.getElementsByTagName("tr");          

        
        var getAllId = component.find("master");
      
        var selorgcons  	=  component.get('v.selectedorgincons');
        var seltollfree 	=  component.get('v.selectedtollfree');
        var selsharedcost   =  component.get('v.selectedsharedcost');
        var selpstn 		=  component.get('v.selectedpstn'); 
        var selregion 		=  component.get('v.selectedregion');


        var countrymasterlabels    =  component.get('v.selconsmasterlabel'); 
        //countrymasterlabels = ['Australiatollfree','Germanysharedcost','Francepstn',]
        console.log ('&&&countrylabel collected are' 	+ countrymasterlabels);
        
        console.log ('***countries collected are ' 	+ selorgcons);
        console.log ('***toll free collected are ' 	+ seltollfree);     
        console.log ('***sharedcost collected are ' + selsharedcost); 
        console.log ('***pstn collected are ' 		+ selpstn); 
        console.log ('***region collected are ' 	+ selregion);
        
        
        var selorgconsln = selorgcons.length;
        var seltollfreeln = seltollfree.length;	
        
        console.log ('selected Countries length $$$$'+ selorgconsln);
        console.log ('selected Agents length $$$$'+ seltollfreeln); 
        	

           for ( var j= 0 ; j < selorgconsln ; j++ ) {
            
            	console.log ('checking for country '+ selorgcons[j]);
              
                  for (var i = 0; i < getAllId.length; i++) {   
                   
                   		console.log ('comparing with ' + component.find("master")[i].get("v.text"));
             
                           if (master[i].get("v.text") == selorgcons[j] ) {
                               
                                   tollfreeyes[i].set("v.value",seltollfree[j]);    
                                   SharedCostyes[i].set("v.value",selsharedcost[j]);  
                                   PSTNyes[i].set("v.value",selpstn[j]);       
                            } 
                      	
    
                       }  
                   
              }      
        
        component.set("v.selectedtollfree", seltollfree);
        component.set("v.selectedsharedcost", selsharedcost);
        component.set("v.selectedpstn",selpstn);
        
        
        console.log('Countries values are--' + selorgcons);
        console.log('Regions values are--' + selregion);
   		console.log('Tollfree values are--' + seltollfree);
        console.log('Sharedcost values are--' + selsharedcost);
        console.log('PSTN agents are--' + selpstn); 
        
    },
    
    saveCookie : function(component, event) {
        document.cookie = component.get('v.selectedcountriesid');
        console.log( 'cookie contains ' + document.cookie);
    },
    
    
})