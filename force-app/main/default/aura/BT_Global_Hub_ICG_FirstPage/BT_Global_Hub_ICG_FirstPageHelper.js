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
        var action = component.get("c.getExceptionCountries");
        action.setParams({
            "CountryName": exceptcountries          	
        });
        action.setCallback(this, function(a) {
            component.set("v.baseurllist", a.getReturnValue());
            component.set("v.allData", a.getReturnValue());
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

    
    checkBoxTest : function (component,event){
                
        var selectedCountries = [];
        var checkvalue = component.find("checkRegion");
        var selagents = [];
        var chckvagtval = component.find("input");
        var capturedregions = [];
        var checkregions = component.find("regions");
        let defaultVal = 0;
        let sum= 0; 
                
        var  table = document.getElementById("myTable"); 
        var td = document.getElementsByTagName('td');
        var tr = table.getElementsByTagName("tr");  

        var selectedHeaderCheck = component.get("v.countries");
        var getAllId = component.find("checkRegion");
        var textId = component.find("input");
      
        var selectedCountries = component.get("v.countries");
       	var selectedAgents = component.get("v.selectedAgents");
        var totalAgents = component.get("v.totalagents");
        var collregions = component.get("v.reservedRegions");
        
        console.log ('regions collected are ' + collregions)
            
            var selectedCountriesln = selectedCountries.length;
 			var selectedAgentsln = selectedAgents.length;	
            
            console.log ('selected Countries length $$$$'+ selectedCountriesln);
            console.log ('selected Agents length $$$$'+ selectedAgentsln);
        	

            for ( var j= 0 ; j < selectedCountriesln ; j++ ) {
            
            	console.log ('checking for country '+ selectedCountries[j]);
              
                  for (var i = 0; i < getAllId.length; i++) {   
                   
                   		//console.log ('comparing with ' + component.find("checkRegion")[i].get("v.text"));
             
                            if (component.find("checkRegion")[i].get("v.text") == selectedCountries[j] ) {
                            
                                component.find("checkRegion")[i].set("v.value",true);  
                                component.find("input")[i].set("v.value",selectedAgents[j]); 
                                
                            } 
                      	
    
                       }  
                   
              }      
        
        component.set("v.countries", selectedCountries);
        component.set("v.selectedAgents", selectedAgents);
        component.set("v.totalagents",totalAgents);
        
        console.log('Country values are--' + selectedCountries);
        console.log('Agent values are--' + selectedAgents);
        console.log('Total agents are--' + totalAgents);
        
    },
    
    APAC : function (component,event) {
        
        var selectedRegion = 'APAC';
        component.set("v.worldregions",selectedRegion);
        var action = component.get("c.getAllRegionCountries");
        action.setParams({
            "RegionName": selectedRegion          	
        });
        action.setCallback(this, function(a) {
            component.set("v.APACData", console.log (a.getReturnValue()));
        });
        $A.enqueueAction(action);
        
    },
    
        EUROPE : function (component,event) {
        
        var selectedRegion = 'EUROPE';
        component.set("v.worldregions",selectedRegion);
        var action = component.get("c.getAllRegionCountries");
        action.setParams({
            "RegionName": selectedRegion          	
        });
        action.setCallback(this, function(a) {
            component.set("v.EUROPEData", console.log(a.getReturnValue()));
        });
        $A.enqueueAction(action);
        
    },
    
    AMERICA : function (component,event) {
        
        var selectedRegion = 'AMERICA';
        component.set("v.worldregions",selectedRegion);
        var action = component.get("c.getAllRegionCountries");
        action.setParams({
            "RegionName": selectedRegion          	
        });
        action.setCallback(this, function(a) {
            component.set("v.AMERICAData", console.log(a.getReturnValue()));
        });
        $A.enqueueAction(action);
        
    },
    
    MEA : function (component,event) {
        
        var selectedRegion = 'MEA';
        component.set("v.worldregions",selectedRegion);
        var action = component.get("c.getAllRegionCountries");
        action.setParams({
            "RegionName": selectedRegion          	
        });
        action.setCallback(this, function(a) {
            component.set("v.MEAData", console.log(a.getReturnValue()));
        });
        $A.enqueueAction(action);
        
    },    
    
    
    
})