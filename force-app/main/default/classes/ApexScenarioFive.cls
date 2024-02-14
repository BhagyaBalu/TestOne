public class ApexScenarioFive {
    public static void updatePhone(){
        List<Contact> con = [SELECT Id, FirstName, LastName, Phone, Email, Account.Phone
                             FROM Contact  
                             WHERE CreatedDate=Today AND Account.Id != null AND Account.Phone != null];
        if(con.size()>0)
        {
            for(Contact c : con)
            {
               if(c.Phone == null)
               {
                   c.Phone=c.Account.Phone;
               }
            }   
        }
        update con;
    }
}