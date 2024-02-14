public class contactlist {

    public PageReference click() {
    contactlist=[select Id,LastName,FirstName from contact limit 5];
        return null;
    }

    

    
    public List<contact> contactlist { get; set; }
    public contactlist(){
 }   
}