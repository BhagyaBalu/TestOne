public with Sharing class UserCreationOnPlatformEvent {
  public static void createUserOnEventPublish(List<ContactUserCreation__e> lstContactUserCreation)
    {
        Set<Id> setContactIds = new Set<Id>();
        List<Contact> lstContacts = new List<Contact>();
        for(ContactUserCreation__e cuc : lstContactUserCreation){
            setContactIds.add(cuc.ContactId__c);
        }
        
        Map<Id, Contact> mapContacts = new Map<Id, Contact>([
             SELECT LastName, Id, AccountId, FirstName, Name, Email, Phone, RecordTypeId, OwnerId, CreatedDate, 
            CreatedById FROM Contact WHERE Id IN :setContactIds
        ]);
        Map<Id, User> mapUsers = new Map<Id, User>([
            SELECT Id, ContactId, FirstName, LastName FROM User WHERE ContactId IN :setContactIds
        ]);
        
        Profile partnerCommunityProfileId = [Select Id from Profile where Name = 'Chatter Free User'];
        
        List<User> lstUsersToUpdate = new List<User>();
        List<User> lstUsersToInsert = new List<User>();

        for (ContactUserCreation__e cuc : lstContactUserCreation) {
            Id contactId = cuc.ContactId__c;

            if (mapUsers.containsKey(mapContacts.get(contactId).Id)) {
                User existingUser = mapUsers.get(mapContacts.get(contactId).Id);
                String concatenatedName = (mapContacts.get(contactId).FirstName != null && mapContacts.get(contactId).FirstName.length() > 0 ? mapContacts.get(contactId).FirstName.substring(0, 1) : '') + (mapContacts.get(contactId).LastName != null && mapContacts.get(contactId).LastName.length() > 3 ? mapContacts.get(contactId).LastName.substring(0, 4) : (mapContacts.get(contactId).LastName != null ? mapContacts.get(contactId).LastName : ''));
                User updateExistingUser = new User();
                updateExistingUser.Id = existingUser.Id;
                updateExistingUser.FirstName = mapContacts.get(contactId).FirstName; 
                updateExistingUser.LastName = mapContacts.get(contactId).LastName;
                updateExistingUser.Alias = concatenatedName;
                updateExistingUser.Email = mapContacts.get(contactId).Email;
               // updateExistingUser.MobilePhone = mapContacts.get(contactId).MobilePhone;
                updateExistingUser.Phone = mapContacts.get(contactId).Phone;
               /* updateExistingUser.City = mapContacts.get(contactId).MailingCity;
                updateExistingUser.Street = mapContacts.get(contactId).MailingStreet;
                updateExistingUser.Country = mapContacts.get(contactId).MailingCountry;
                updateExistingUser.PostalCode = mapContacts.get(contactId).MailingPostalCode;
                updateExistingUser.FederationIdentifier = mapContacts.get(contactId).V_BaldoUserId__c;
                updateExistingUser.IndividualId = mapContacts.get(contactId).IndividualId;*/
                updateExistingUser.LanguageLocaleKey = 'en_US';
                updateExistingUser.LocaleSidKey = 'en_US';
                updateExistingUser.EmailEncodingKey = 'UTF-8';
                updateExistingUser.TimeZoneSidKey = 'Pacific/Pitcairn';
                //updateExistingUser.CurrencyIsoCode = mapContacts.get(contactId).CurrencyIsoCode;
                //newUser.V_ParentRoleName__c = mapContacts.get(contactId).CurrencyIsoCode;
                
                lstUsersToUpdate.add(updateExistingUser);
            } else {
                // New contact, create a new user             
                if(mapContacts.get(contactId).Email != null){  
                    System.Domain domain = System.DomainParser.parse(URL.getOrgDomainUrl());
                    String concatenatedName = (mapContacts.get(contactId).FirstName != null && mapContacts.get(contactId).FirstName.length() > 0 ? mapContacts.get(contactId).FirstName.substring(0, 1) : '') + (mapContacts.get(contactId).LastName != null && mapContacts.get(contactId).LastName.length() > 3 ? mapContacts.get(contactId).LastName.substring(0, 4) : (mapContacts.get(contactId).LastName != null ? mapContacts.get(contactId).LastName : ''));
                    User newUser = new User();
                    newUser.ContactId = contactId;
                    newUser.ProfileId = partnerCommunityProfileId.Id;
                    newUser.FirstName = mapContacts.get(contactId).FirstName; 
                    newUser.LastName = mapContacts.get(contactId).LastName;
                    newUser.Alias = concatenatedName;
                    newUser.Email = mapContacts.get(contactId).Email;
                   // newUser.MobilePhone = mapContacts.get(contactId).MobilePhone;
                    newUser.Phone = mapContacts.get(contactId).Phone;
                    newUser.UserName = mapContacts.get(contactId).Email +'.'+domain.getSandboxName();
                   /* newUser.City = mapContacts.get(contactId).MailingCity;
                    newUser.Street = mapContacts.get(contactId).MailingStreet;
                    newUser.Country = mapContacts.get(contactId).MailingCountry;
                    newUser.PostalCode = mapContacts.get(contactId).MailingPostalCode;
                    newUser.FederationIdentifier = mapContacts.get(contactId).V_BaldoUserId__c;
                    newUser.IndividualId = mapContacts.get(contactId).IndividualId;*/
                    newUser.LanguageLocaleKey = 'en_US';
                    newUser.LocaleSidKey = 'en_US';
                    newUser.EmailEncodingKey = 'UTF-8';
                    newUser.TimeZoneSidKey = 'Pacific/Pitcairn';
                    //newUser.CurrencyIsoCode = mapContacts.get(contactId).CurrencyIsoCode;
                    //newUser.V_ParentRoleName__c = mapContacts.get(contactId).CurrencyIsoCode;
                    lstUsersToInsert.add(newUser);
                }
            }
        }

        // Perform DML operations
        if (!lstUsersToUpdate.isEmpty()) {
            update lstUsersToUpdate;
        }

        if (!lstUsersToInsert.isEmpty()) {
            insert lstUsersToInsert;
        }
        
    }
}