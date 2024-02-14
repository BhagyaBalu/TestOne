trigger WarrantSummary on Case (before insert) {
    String endingstatement = 'Have a nice day!!';
    for (Case myCase : Trigger.new) {
        //setup variables to use in the summary field
        String purchaseDate           = myCase.Product_Purchase_Date__c.format();
        String createdDate            = DateTime.now().format();
        Integer warrantDays           = myCase.Product_Total_Warranty_Days__c.intValue();
        Decimal warrantyPercentage    = (100 * (myCase.Product_Purchase_Date__c.daysBetween(Date.today()) 
                                                / myCase.Product_Total_Warranty_Days__c)).setScale(2);
        Boolean hasExtendedWarranty   = mycase.Product_Has_Extended_Warranty__c;
        //Populate Summary field
        myCase.Warranty_Summary__c = 'Product purchased on ' + purchaseDate + ' '
                                     + 'and case created on ' + createdDate + '.\n'
                                     + 'Warrant is for ' + warrantDays + ' '
                                     + 'days and is ' + warrantyPercentage 
                                     + '% through it`s warranty period' + '.\n'
                                     + 'Extended warranty: ' + hasExtendedWarranty + '.\n' 
                                     + endingstatement;
}
}