@isTest
private class AssignTaskTestClass {
   /* @testSetup static void setup(){
        List<Lead> ld = new List<Lead>();
        for (Integer i=1;i<6;i++)
        {
            ld.add(new Lead(FirstName = 'TestLead'+i, Salutation = 'Mr', LastName = 'LName'+i, Company = 'AR'+i, Status = 'Open - Not Contacted'));
        }
        insert ld;
    } */
    @istest Static void TestMethod1(){
        Lead ld = new Lead(FirstName = 'TestLead'+1, Salutation = 'Mr', LastName = 'LName'+1, Company = 'AR'+1, Status = 'Open - Not Contacted');
        //ld.add(new Lead(FirstName = 'TestLead'+1, Salutation = 'Mr', LastName = 'LName'+1, Company = 'AR'+1, Status = 'Open - Not Contacted'));
        System.debug('Lead details pre insert ' + ld.Status);
        Test.startTest();
           insert ld;
        Test.stopTest();
        Lead lee = [SELECT Id, FirstName FROM Lead WHERE Id =:ld.Id];
        System.assertEquals('TestLead1', lee.FirstName);
    }
   /* @istest Static void TestMethod1(){
        
    }*/
}