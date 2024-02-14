trigger SubscribePlatformEvent on ContactUserCreation__e (after insert) {   
    // List to hold all cases to be created.
   /* List<Case> cases = new List<Case>();
    
    // Get user Id for case owner. Replace username value with a valid value.
    User adminUser = [SELECT Id FROM User WHERE Username='admin@acme.org'];
       
    // Iterate through each notification.
    for (Low_Ink__e event : Trigger.New) {
        System.debug('Printer model: ' + event.Printer_Model__c);
        if (event.Printer_Model__c == 'MN-123') {
            // Create Case to order new printer cartridge.
            Case cs = new Case();
            cs.Priority = 'Medium';
            cs.Subject = 'Order new ink cartridge for SN ' + event.Serial_Number__c;
            // Optional: Set case owner ID so it is not Automated Process.
            // This step is not needed if the running user is overridden 
            // or if using assignment rules.
            cs.OwnerId = adminUser.Id;
            cases.add(cs);
        }
    }
    
    // Insert all cases in the list.
    if (cases.size() > 0) {
        insert cases;
    } */
    
    //BypassTriggers__c bypassTriggers = BypassTriggers__c.getinstance();
    //if((!bypassTriggers.ContactUserCreationTrigger__c) && (!bypassTriggers.AllTriggers__c)){
        if(Trigger.isAfter)
        {
            if(Trigger.isInsert || Trigger.isUpdate)
            {
                UserCreationOnPlatformEvent.createUserOnEventPublish(Trigger.New);
            }
        }
    System.debug('@@@@@@@@@@@@@@@@helloo');
        UserCreationOnPlatformEvent.createUserOnEventPublish(Trigger.New);
        
}