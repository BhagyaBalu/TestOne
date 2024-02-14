trigger AfterScenarios on Opportunity (after insert, after update, after delete) {
if(Trigger.isAfter)
{
    if(Trigger.isInsert)
    {
        AfterScenariosClass.afterInsert(Trigger.New);
    }else if(Trigger.isUpdate){
        AfterScenariosClass.afterUpdate(Trigger.New, Trigger.oldMap);
    }else if(Trigger.isDelete){
        AfterScenariosClass.afterDelete(Trigger.Old);
    }
}
}