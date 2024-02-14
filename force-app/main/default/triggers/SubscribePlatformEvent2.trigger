trigger SubscribePlatformEvent2 on ContactUserCreation__e (after insert) {    
    // List to hold all cases to be created.
    List<Case> cases = new List<Case>();
    
    // Get user Id for case owner. Replace username value with a valid value.
    User adminUser = [SELECT Id FROM User WHERE Username='balu@kmit.com'];
       
    // Iterate through each notification.
    for (ContactUserCreation__e event : Trigger.New) {
        System.debug('ContactId ' + event.ContactId__c);
            // Create Case to order new printer cartridge.
            Case cs = new Case();
            cs.Priority = 'Medium';
            cs.Subject = 'Event created for ' + event.ContactId__c;
            // Optional: Set case owner ID so it is not Automated Process.
            // This step is not needed if the running user is overridden 
            // or if using assignment rules.
            cs.OwnerId = adminUser.Id;
            cases.add(cs);
    }
    
    // Insert all cases in the list.
    if (cases.size() > 0) {
        insert cases;
    }
}