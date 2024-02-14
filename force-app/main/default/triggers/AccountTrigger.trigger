trigger AccountTrigger on Account (before insert, after insert) {
    if(Trigger.isInsert)
    {   
        if(Trigger.isBefore)
        {
            AccountTriggerHandler.beforeIns(Trigger.New);
        }else if(Trigger.isAfter)
        {
            AccountTriggerHandler.afterIns(Trigger.New);
        }
    }
}