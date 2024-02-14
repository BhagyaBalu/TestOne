trigger AssignTaskTrigger on Lead (before insert) {
if(Trigger.isInsert && Trigger.isAfter)
{
    AssignTask.createTask(Trigger.New);
}
}