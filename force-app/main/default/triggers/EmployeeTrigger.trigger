trigger EmployeeTrigger on Employee__c (before delete, after delete, after undelete) {
    if(Trigger.isDelete){
        if(Trigger.isBefore){
            AccountEmp.cannotDelEmp(Trigger.old);
        }else if(Trigger.isAfter){
            //AccountEmp.UpdateLeftEmpCountOnAcc(Trigger.old);
        }   
    }
    if(Trigger.isUndelete){
        AccountEmp.undeleteEmp(Trigger.new);
    }
}