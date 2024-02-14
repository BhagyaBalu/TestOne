trigger BeforeScenarios on Account (before insert, before update, before delete) {
    if(Trigger.isInsert)
    {
        if(Trigger.isBefore)
        {
            BeforeScenariosClass.beforeInsert(Trigger.new);
        }
    }
    if(Trigger.isUpdate)
    {
        if(Trigger.isBefore)
        {
            BeforeScenariosClass.beforeUpdate(Trigger.New, Trigger.OldMap);
        }
    }
    if(Trigger.isDelete)
    {
        if(Trigger.isBefore)
        {
            BeforeScenariosClass.beforeDelete(Trigger.Old);
        }
    }
    /*
    if(Trigger.isBefore)
    {
        if(Trigger.isInsert)
        {
            BeforeScenariosClass.beforeInsert(Trigger.new);
        }else if(Trigger.isUpdate)
    	{
            BeforeScenariosClass.beforeUpdate(Trigger.New, Trigger.OldMap);
        }else if(Trigger.isDelete)
    	{
			BeforeScenariosClass.beforeDelete(Trigger.Old);
        }
    }

     */
}