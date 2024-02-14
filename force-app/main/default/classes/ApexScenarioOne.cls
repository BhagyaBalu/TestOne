public class ApexScenarioOne {
    public void oppCreate(){
        List<Account> acc = [SELECT Id, Name FROM Account WHERE CreatedDate = THIS_YEAR];
        List<Opportunity> opp = new List<Opportunity>();
        //Heere if condition can be as acc.size()>0
        if(!acc.isEmpty()){
         for(Account a : acc)
         {
           	Opportunity op = new Opportunity();
           	op.Name = 'Test1';
            op.CloseDate = system.today();
            op.StageName = 'Prospecting';
            opp.add(op);
         }
        }
        if(opp.size() > 0){
            insert opp;
        }
    }
}