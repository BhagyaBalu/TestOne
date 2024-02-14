public class ApexFutureAccConCalculate {
    @future
    public static void calculateContacts(List<Id> accIds)
    {
        List<Account> acc = [SELECT Id, (SELECT Id FROM Contacts)FROM Account WHERE Id IN: accIds];
        for(Account a : acc)
        {
            a.Total_Contacts__c = a.Contacts.size();
        }
        if(!acc.isEmpty())
        {
            update acc;
        }
    }
}