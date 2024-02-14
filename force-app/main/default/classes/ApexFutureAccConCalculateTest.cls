@isTest
public class ApexFutureAccConCalculateTest {
@isTest
    Private Static void countConTest()
    {
        List<Account> accList = new List<Account>();
        for(Integer i=0; i<250; i++)
        {
            accList.add(new Account(Name='Test'+i));
        }
        insert accList;
        
        List<Contact> conList = new List<Contact>();
        List<Id> accIds = new List<Id>();
        for(Account acc : accList)
        {
            conList.add(new Contact(FirstName='Test', LastName = acc.Name, AccountId = acc.Id));
            accIds.add(acc.Id);
        }
        insert conList;
        Test.startTest();
        ApexFutureAccConCalculate.calculateContacts(accIds);
        Test.stopTest();
        
        List<Account> accs = [SELECT Id, Total_Contacts__c FROM Account];
        System.assertEquals(1, accs[0].Total_Contacts__c, 'Contacts are not counted successfully');
        //System.assertEquals(expected, actual, msg)
    }
}