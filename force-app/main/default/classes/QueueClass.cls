public class QueueClass implements Queueable {
	Private List<Account> accList;
    Private Id parentAccId;
    public QueueClass(List<Account> accRecords, Id id)
    {
        this.accList = accRecords;
        this.parentAccId = id;
    }
    public void execute(QueueableContext context)
    {
        for(Account acc : accList)
        {
            acc.ParentId = parentAccId;
        }
        update accList;
    }
}