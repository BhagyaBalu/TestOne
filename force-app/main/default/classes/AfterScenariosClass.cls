public class AfterScenariosClass {
    public static void afterInsert(List<Opportunity> oppList){
        /* Set<Id> accIds = new Set<Id>();
        List<Account> accToBeUpdated = new List<Account>();
        
        for(Opportunity opp : newList)
        {
            if(opp.AccountId != null)
            {
                accIds.add(opp.AccountId);
            }
        }
        accToBeUpdated = calculateAnnualRevenue(accIds);
        if(!accToBeUpdated.isEmpty())
        {
            update accToBeUpdated;
        } 
*/
    }
    public static void afterUpdate(List<Opportunity> oppList, Map<Id,Opportunity> oldList){
        
    }
    public static void afterDelete(List<Opportunity> oppList){
        
    }
   /* List<Account> calculateAnnualRevenue(Set<Id> accIds){
        
    } */
}