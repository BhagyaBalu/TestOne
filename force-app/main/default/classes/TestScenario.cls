public class TestScenario {
    public static void updateOpp(List<Account> accList, Map<Id,Account> oldAccList)
    {
        Map<Id,Account> accIdToAccMap = new Map<Id,Account>();
        List<Opportunity> oppToBeUpdated = new List<Opportunity>();
        
        for(Account acc : accList)
        {
           if(oldAccList!=null)
           {
               accIdToAccMap.put(acc.Id, acc);
           }
        }
        for(Opportunity opp : [SELECT Id, StageName, CreatedDate, AccountId FROM Opportunity WHERE AccountId IN: accIdToAccMap.keySet()]){
            Opportunity oppor = new Opportunity();
            if(accIdToAccMap.containsKey(opp.AccountId)){
                    if(opp.CreatedDate.date().daysBetween(Date.Today()) > 45 && opp.StageName != 'Closed Won'){
                        oppor.Id = opp.Id;
                    	oppor.StageName = 'Closed Lost';
                        oppToBeUpdated.add(oppor);
                        }
                //oppToBeUpdated.add(oppor);
            }
        }
    	if(!oppToBeUpdated.isEmpty())
        {
            update oppToBeUpdated;
        }
    }
}