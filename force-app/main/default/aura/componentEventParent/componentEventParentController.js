({
  handleEvent : function(component, event, helper) 
 {
//get response value fired from parent
var response = event.getParam("eventResponse"); 
//Set the value recieved from the event
component.set("v.eventValue", response);     
  }
})