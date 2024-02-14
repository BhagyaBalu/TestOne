public class AccountTriggerHandler {
	public static void beforeInsert(List<Account> newList)
	{
    	for(Account acc : newList)
        {
            acc.Description = 'Test Description';
        }
	}
    public static void beforeIns(List<Account> acct)
    {
        for(Account a : acct)
        {
            if(a.Industry != null && a.Industry == 'Media')
            {
                a.Rating = 'Hot';
            }
        }
    }
    public static void afterIns(List<Account> acct)
    {
        List<Opportunity> oppToBeInserted = new List<Opportunity>();
        for(Account a : acct)
        {
           Opportunity opp = new Opportunity();
           opp.Name = a.Name;
           opp.AccountId = a.Id;
		   opp.StageName = 'Prospecting';
           opp.CloseDate = System.today();
           oppToBeInserted.add(opp);
        }
        if(!oppToBeInserted.isEmpty())
        {
           insert oppToBeInserted;
        }
    }
}