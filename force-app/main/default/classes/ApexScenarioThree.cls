public class ApexScenarioThree {
	public static void updateOppDesc()
    {
        List<Opportunity> opp = [SELECT Id, Name, CloseDate, StageName, Description FROM Opportunity WHERE CreatedDate = THIS_WEEK AND StageName = 'Closed Lost'];
        if(!opp.isEmpty())
        {
            for(Opportunity o : opp)
            {
                if(o.StageName == 'Closed Won')
                {
                    o.Description = 'Opportunity is Closed Won';
                }
                else if(o.StageName == 'Closed Lost')
                {
                    o.Description = 'Opportunity is Closed lost';
                }
            }
        }
        if(!opp.isEmpty()){
            update opp;
        }
    }
}