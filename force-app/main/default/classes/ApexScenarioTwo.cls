public class ApexScenarioTwo {
    public void updatePhone()
    {
     List<Account> acc = [SELECT Id, Name, Phone FROM Account WHERE CreatedDate = TODAY];
     if(!acc.isEmpty())
     {
         for(Account a : acc)
         {
             a.Phone = '1234567890';
         }
     }
     if(!acc.isEmpty())
     {
         update acc;
     }   
    }
}