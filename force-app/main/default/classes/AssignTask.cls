public class AssignTask {
public static void createTask(List<Lead> leadList)
{
    List<Task> tsk = new List<Task>();
    for(Lead ld : leadList)
    {
        //if(ld.LastName!=null){
            Task t = new Task();
        	//System.debug(ld.Id);
            //t.WhoId = ld.Id;
            t.Status = 'Not Started';        
            //t.OwnerId = ld.OwnerId;
        	t.OwnerId = '0056F000006RNu9QAG';
            t.Subject = 'Call';        
            t.Priority = 'Normal';
        	//System.debug('Task Created Name: '+t.WhoId);
            tsk.add(t);
    }
    if(!tsk.isEmpty())
    {
        insert tsk;
    }
}
}