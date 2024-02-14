trigger TestScenarioTrigger on Account (after update) {
if(Trigger.isUpdate)
{
    if(Trigger.isAfter)
    {
        TestScenario.updateOpp(Trigger.New, Trigger.oldMap);
    }
}
}