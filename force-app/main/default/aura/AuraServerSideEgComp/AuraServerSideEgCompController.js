({
 echo : function(cmp, event, helper) {
  var action = cmp.get("c.serverEcho");
        action.setParams({
            firstName : cmp.get("v.firstName")
        })
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS")
            {
                alert("This is from server ::"+ response.getReturnValue());
            }
            else if(state === "INCOMPLETE")
            {
                //do something 
            }
            else if(state === "ERROR")
            {
             var error = response.getError();
             if(error)
             {
                 console.log("error"+errors);
             }
            }
        });
          $A.enqueueAction(action);
 }
})