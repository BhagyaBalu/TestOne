public class BeforeScenariosClass {
    public static void beforeInsert(List<Account> accList){
       for(Account acc : accList)
       {
           acc.Description = 'Updated';
       }
    }
    public static void beforeUpdate(List<Account> accList, Map<Id,Account> oldMap){
       for(Account acc : accList)
       {
           if(oldMap!=null && acc.Phone != oldMap.get(acc.Id).Phone)
           {
           acc.Description = 'Phone Updated';
           }
       }
    }
    public static void beforeDelete(List<Account> accList){
       for(Account acc : accList)
       {
           if(acc.Active__c == 'yes')
           {
           acc.addError('Active Account cannot be deleted');
           }
       }
    }
}