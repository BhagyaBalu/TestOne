({
    handleClick : function(component, event, helper)
    {
    var n1 = component.get("v.num1");
    var n2 = component.get("v.num2");  
	var result = 0;
    var buttonclick = event.getSource().get("v.label");
	/* if(buttonclick === "Add"){
             result = n1 + n2 ;
          component.set("v.num3",result);
        }else if (buttonclick === "Substract"){
            if (n1 > n2){
                result = n1 - n2;
            }else{
                result = n2 - n1;
            }
            component.set("v.num3",result);
        	}else if  (buttonclick === "Multiply"){
            result = n1 * n2 ;
          component.set("v.num3",result);
            }else if (buttonclick === "Divide"){
                if (n1 > n2){
            		result = n1 / n2 ;
                }else
                {
                    result = n2 / n1 ;
                }
          	component.set("v.num3",result);
   			} */
        switch(buttonclick) {
            case "Add":
            	result = n1 + n2 ;
          		component.set("v.num3",result);
                break;
            case "Substract":
            	if (n1 > n2){
                	result = n1 - n2;
            	}else{
                	result = n2 - n1;
            	}
            	component.set("v.num3",result);
    			break;
            case "Multiply":
            	result = n1 * n2 ;
          		component.set("v.num3",result);
            	break;
            case "Divide":
               	if (n1 > n2){
            		result = n1 / n2 ;
                }else
                {
                    result = n2 / n1 ;
                }
          		component.set("v.num3",result);
   				break;
            case "Clear":
                component.set("v.num1",null);
         		component.set("v.num2",null);
                component.set("v.num3",null);
                break;
        }
    },
    
    /* handleClear : function(component, event, helper) 
    {
    component.set("v.num1",null);
         component.set("v.num2",null);
	} */
    
})