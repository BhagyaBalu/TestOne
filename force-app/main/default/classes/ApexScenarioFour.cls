public class ApexScenarioFour {
    public static void numOfCon(){
        List<Account> acc = [SELECT Id, Name, Total_Contacts__c, 
                             (SELECT Id, FirstName, LastName, Phone, Email FROM Contacts) 
                             FROM Account 
                             WHERE CreatedDate=Today];
        /* 
		if(!acc.isEmpty())
		{
			for(Account a : acc)
			{
				a.Total_Contacts__c = a.Contacts.size();
			}
		}
		if(!acc.isEmpty())
		{
			update acc;
		}
		*/
        integer count=0;
        if(!acc.isEmpty())
        {
            for(Account a : acc)
            {
                if(!a.Contacts.isEmpty())
                {
                	for(Contact c : a.Contacts)
                	{                   
                    	count = count+1;
                	}
                	a.Total_Contacts__c = count;
                }
                else
                {
                   a.Total_Contacts__c = 0; 
                }
            }
        }
        update acc;
    }
}