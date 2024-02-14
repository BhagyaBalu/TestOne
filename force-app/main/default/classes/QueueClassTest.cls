@isTest
public class QueueClassTest {
@testSetup
    static void setup(){
        List<Account> accList = new List<Account>();
        accList.add(new Account(Name='Parent'));
        for(Integer i=0; i<100; i++)
        {
           accList.add(new Account(Name='Test Account' + i));
        }
        insert accList;
    }
    @isTest
    Private static void testQueueable()
    {
        Id parentId = [SELECT Id FROM Account WHERE Name='Parent'][0].id;
        List<Account> accList = [SELECT Id, Name FROM Account WHERE Name Like 'Test Account%'];
        QueueClass updateJob = new QueueClass(accList, parentId);
        
        Test.startTest();
        System.enqueueJob(updateJob);
        Test.stopTest();
        
        System.assertEquals(100, [SELECT count() FROM Account WHERE parentId = :parentId]);
    }
}