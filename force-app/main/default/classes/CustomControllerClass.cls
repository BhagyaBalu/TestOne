public class CustomControllerClass {

    public List<contact> contactlist { get; set; }
    public CustomControllerClass(){
    contactlist=[select Id,LastName,FirstName from contact limit 5];
}
}