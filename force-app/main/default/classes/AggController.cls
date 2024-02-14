public class AggController {

    public PageReference exp() {
        return null;
    }

 public integer num1{ get; set;}
 public integer num2{ get; set;}
 public integer Result{ get; set;}
    public PageReference multiply() {
        Result=num1*num2;
        return null ;
    }


    public PageReference add() {
        Result=num1+num2;
        return null;
    }
public PageReference div() {
        Result=num1/num2;
        return null;
    } 
    
}