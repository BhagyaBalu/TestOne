public class ObjectsUsageClass {
    public void demoObjects(){
        //Standard Objects
       /* Account acc = new Account();
        acc.Name = 'AnuSha';
        acc.Phone = '9849920410';
        acc.Website = 'www.salesforce.com';
        System.debug('Newly created Account details are: '+acc);
        Contact con = new Contact(Phone='9347105240');
        System.debug('Newly created Contact details are: '+con);
        
        //Custom Objects
        Vehicle__c veh = new Vehicle__c(Name='Veh1',VIN_Number__c='12345');
        System.debug('Newly created Vehicle details are: '+veh);
        //Below assignment will override veh record with new assigned values
        veh.Name='Veh2';
        veh.VIN_Number__c='67890';
        Vehicle__c veh3 = new Vehicle__c(Name='Veh3',VIN_Number__c='123456');
        System.debug('Newly created Vehicle details are: '+veh);
        System.debug('Newly created Vehicle details are: '+veh3);
        
        //Generic sObject
        sObject obj;
        obj = new Account(Name='Sush',Phone='1234567890');
        Account accT = (Account)obj;
        System.debug('Tycasted Newly created Account details are: '+accT);
        
        //Loop Demo
        List<Account> a = new List<Account>();
        List<Id> accIds = new List<Id>();
        Set<Id> accIdss = new Set<Id>();
        a = [SELECT Id, Name from Account LIMIT 3];
        //Null check before loop is best practice and helps to avoid runtime errors
        if(!a.isEmpty())
        {
        for(Account ac : a)
        	{
            	accIds.add(ac.Id);
        	}
        System.debug('Account Ids: '+accIds);
   		}
        
        //Use SOQL in loop, which doesn't require null check for loop however, best practice is to check the code before printing
        for(Account acs : [SELECT Id, Name from Account LIMIT 2])
        	{
            	accIdss.add(acs.Id);
        	}
        if(!accIdss.isEmpty()){
        System.debug('Account Ids: '+accIdss);
        } */
        
        //MAP in loop
        // One way is to create a variable for storing the data of a SOQL and passing it in the MAP declaration
        // The other way is to create the MAP via declaration and to pass the SOQL as a parameter
        List<Account> mapAccIds = new List<Account>();
        Set<Id> accId = new Set<Id>();
        mapAccIds = [SELECT Id, Name from Account LIMIT 3];
        Map<Id,Account> mapLoop = new Map<Id,Account>(mapAccIds);
        
        if(!mapAccIds.isEmpty())
        {
            for (Account b : mapAccIds)
            {
                accId.add(b.Id);
            }
        }
        if(!accId.isEmpty())
        {
            for(Id i : accId)
            {
                if(mapLoop.containsKey(i))
                {
                    System.debug('map value =>' + mapLoop.get(i));
                }
            }
        }
        
    }
}