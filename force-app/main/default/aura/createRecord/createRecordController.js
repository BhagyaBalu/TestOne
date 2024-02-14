({    
  handleChange: function (component, event) {
  // This will contain the string of the "value" attribute of the selected option
        var selectedOptionValue = event.getParam("value");
        component.set("v.type", selectedOptionValue);
    },
    
  save : function (component, event, helper){
        //get all the inputs from form
        var name = component.get("v.name");
        var type = component.get("v.type");
        var annualRevenue = component.get("v.annualRevenue");
        
        //Error handling: if any field is undefined
        if(name == undefined || type == undefined || annualRevenue == undefined)
        {
         helper.showToast('Ooops !', 'Please fill up all the information', 'error');
        }
        else
        {
    //if everything is okey then make server call   
      var action = component.get("c.saveAccount"); 
         action.setParams({
           name : name, 
           accountType : type,
           revenue : annualRevenue
            }); 
     action.setCallback(this,function(response){
     var state = response.getState();
 //if callback is Success then show toast message and close the modal popup
         if(state === "SUCCESS")
         {
//pass parameters to helper showToast method  
  helper.showToast('Success !', 'Record Inserted Successfully', 'success');
           $A.get("e.force:closeQuickAction").fire();
         }
       });
          $A.enqueueAction(action);
      }  
    },
    
    cancel : function(component, helper, event)
    {
        //Below line of code will close the modal popup
        $A.get("e.force:closeQuickAction").fire();   
    }
})