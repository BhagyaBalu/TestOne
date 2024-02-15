public class AccountEmp {
    public static void cannotDelEmp(List<Employee__c> empList){
        for(Employee__c e : empList)
        {
            if(e.Active__c == True)
            {
                e.addError('Active Employee cannot be deleted');
            }
        }
    }
    //Just for demo test 2
 /*   public static void UpdateLeftEmpCountOnAcc(List<Employee__c> empList){
     	Set<Id> accIds = new Set<Id>();
        List<Account> accToBeUpdated = new List<Account>();
        Map<Id,Account> accIdToAccMap;
        List<Employee__c> eList = new List<Employee__c>();
        Map<Id,Decimal> accIdToTotalCount = new Map<Id,Decimal>();
        for(Employee__c emp : empList)
        {
            //if(emp.Account__c != null)
            if(emp.Id != null)
            {
                //accIds.add(emp.Account__c);
                accIds.add(emp.Id);
                eList.add(emp);
            }
        }
        if(!accIds.isEmpty())
        {
            accIdToAccMap = new Map<Id,Account>([SELECT Id, Left_Emp_Count__c FROM Account WHERE Id IN: accIds]); 
        }
        if(!empList.isEmpty()){
            for(Employee__c emp : empList){
                //if(accIdToAccMap.containsKey(emp.Account__c)){
                if(accIdToAccMap.containsKey(emp.Id)){
                    //Decimal count = accIdToTotalCount.get(emp.Account__c) + 1;
                    Decimal count = accIdToTotalCount.get(emp.Id) + 1;
                    //accIdToTotalCount.put(emp.Account__c,count);   
                    accIdToTotalCount.put(emp.Id,count);   
                }else{
                    //accIdToTotalCount.put(emp.Account__c,accIdToAccMap.get(emp.Account__c).Left_Emp_Count__c + 1);
                    accIdToTotalCount.put(emp.Id,accIdToAccMap.get(emp.Id).Left_Emp_Count__c + 1);
                }
            }    
        }
    for(Id accId : accIdToTotalCount.keySet()){
        Account acc = new Account();
        acc.id = accId;
        acc.Left_Emp_Count__c = accIdToTotalCount.get(accId);
        accToBeUpdated.add(acc);
    }
    if(!accToBeUpdated.isEmpty())
    {
        update accToBeUpdated;
    }
} */
    public static void undeleteEmp(List<Employee__c> empList)
    {
        List<Employee__c> empToBeupdated = new List<Employee__c>();
        for(Employee__c emp : empList)
        {
            Employee__c e = new Employee__c();
            e.Id = emp.Id;
            e.Active__c = true;
            empToBeupdated.add(e);
        }
        if(!empToBeupdated.isEmpty())
        {
            insert empToBeupdated;
        }
    }
}