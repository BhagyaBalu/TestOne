@isTest
public class OppBatchTest {
@isTest
    Private static void testBatchClass(){
        List<Opportunity> oppList = new List<Opportunity>();
        for(integer i=0; i<200; i++)
        {
            oppList.add(new Opportunity(Name='Test'+i, StageName='Prospecting', CloseDate=System.today()));
        }
        insert oppList;
        Test.startTest();
        OppBatch opps = new OppBatch();
        Id batchId = Database.executeBatch(opps, 200);
        Test.stopTest();
        
        List<Opportunity> updatedOpps = [SELECT Id FROM Opportunity WHERE LeadSource = 'Web'];
        System.assertEquals(200, updatedOpps.size());
    }
}