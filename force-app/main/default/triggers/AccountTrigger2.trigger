trigger AccountTrigger2 on Account (before update, after update) 
{
	if(Trigger.isUpdate)
    {
        if(Trigger.isBefore)
        {
          AccountTriggerHandlerTwo.beforeUpdate(Trigger.New, Trigger.OldMap);  
        }else if(Trigger.isAfter)
        {
          AccountTriggerHandlerTwo.afterUpdate(Trigger.New, Trigger.OldMap); 
        }
    }
}