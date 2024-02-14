public class AccountTriggerHandlerTwo {
    public static void beforeUpdate(List<Account> accList, Map<Id,Account> oldAccList)
    {
        for(Account a : accList)
        {
            if(oldAccList!=null && a.Phone != oldAccList.get(a.Id).Phone){
               a.Description = 'Phone Updated'; 
            }
        }
    }
	public static void afterUpdate(List<Account> accList, Map<Id,Account> oldAccList)
    {
        Map<Id,Account> accIdToAccMap = new Map<Id,Account>();
        List<Opportunity> oppToBeUpdated = new List<Opportunity>();
        
        for(Account acc : accList)
        {
           if(oldAccList!=null && acc.Phone != oldAccList.get(acc.Id).Phone)
           {
               accIdToAccMap.put(acc.Id, acc);
           }
        }
        for(Opportunity opp : [SELECT Id, Opp_Phone__c, AccountId FROM Opportunity WHERE AccountId IN: accIdToAccMap.keySet()]){
            Opportunity oppor = new Opportunity();
            if(accIdToAccMap.containsKey(opp.AccountId)){
                oppor.Id = opp.id;
                oppor.Opp_Phone__c = accIdToAccMap.get(opp.AccountId).Phone;
                oppToBeUpdated.add(oppor);
            }
        }
    	if(!oppToBeUpdated.isEmpty())
        {
            update oppToBeUpdated;
        }
    }
}