@isTest
private class BeforeScenariosAccountTestClass {
 static testMethod void AccountTestData() {
    // List<Account> acc = new List<Account>();
 //Account acc1 = new Book__c(Name='Behind the Cloud', Price__c=100);
 //System.debug('Price before inserting new book: ' + b.Price__c);    
    /* for(int i=0; i<5; i++)
        {
            Account a = new Account();
            a.Name = 'Test Account'i+1;
            //a.Active__c = true;
            acc.add(a);
        }
            insert acc;
*/     
 Account acc1 = new Account(Name='Account test class One');
 Test.startTest();
 // Insert Account
 insert acc1;
 //Account acc1 = new Account(Name='Account test class One');
 Test.stopTest();
 
 // Retrieve the new book
 acc1 = [SELECT Name, Description FROM Account WHERE Id =:acc1.Id];
 System.debug('Record after trigger fired: ' + acc1.Description);
 
 // Test that the trigger correctly updated the price
 System.assertEquals('Updated', acc1.Description);
 }
}