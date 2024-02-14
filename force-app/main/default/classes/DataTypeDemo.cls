public class DataTypeDemo {
    // Creating a constructor 
    public DataTypeDemo(){
     System.debug('Hello I am the constructor');   
    }
    /* DataTypeDemo d = new DataTypeDemo(); has to be called via Execute Anonymous Window
    
    Demo method. Method requires explicit calling. 
     DataTypeDemo d = new DataTypeDemo();
     d.methodDemo(); */
    public static void methodDemo(){
       System.debug('I am method');
        Account acc1 = new Account();
        acc1.Name = 'Bhagya';
        acc1.Phone = '1234567890';
        System.debug('Account : ' + acc1);
    
    // Type casting object instance to specific object instance
    
    	sObject obj = new Account(Name = 'Test');
        Account acc2 = (Account)obj;
        System.debug('Account after type cast = ' +acc2); 
        
    // List Demo
    	List<String> strList = new List<String>();
        List<String> strList2 = new List<String>();
        Set<String> strSet = new Set<String>();
        Set<String> strSet2 = new Set<String>();
       // Map<Integer,String> intStrMap = new Map<Integer,String>();
        
        Boolean res;
        Boolean check;
        Boolean c1;
        Boolean c2;
        
        sObject sobj = [SELECT Id, Name from Account LIMIT 1];
        
        //add method demo
        strList.add('A');
        strList.add('B');
        //strList2.add(2,'C');
        
        //addAll method demo
        strList2.addAll(strList);
        strSet.add('Aus');
        strList.addAll(strSet);
        System.debug('String List : '+ strList);
        System.debug('StrList2 =>'+ strList2);
        
        //clear method demo
        strList2.clear();
        System.debug('StrList2 =>'+ strList2);
        
        //clone method demo
        strList2 = strList.clone();
        System.debug('StrList2 =>'+ strList2);
        
        //contains method demo
        res = strList.contains('A');
        System.debug('res =>'+ res);
        
        //check method demo
        check = strList.equals(strList2);
        System.debug('check results =>'+ check);
        
        //get method demo
        System.debug('String List : '+ strList.get(1));
        
        //IndexOf method demo
        System.debug('String List : '+ strList.indexOf('A'));
        
        //isEmpty
        System.debug('String List is empty: '+ strList.isEmpty());
        
        //getSObjectType method demo
        System.debug('SObject Type => '+ sobj.getSObjectType());
        
        //removeIndex method demo
        System.debug('String List is empty: '+ strList.remove(1));
        System.debug('String List after removal : '+ strList); 
        
        //Size method demo
        System.debug('String List size : '+ strList.size());
        
        //sort method demo
        strList.sort();
        System.debug('Sorted List : '+ strList);
        
        strSet.clear();
        
        //containsAll listToCompare demo
        strSet.add('Bhagya');
        strSet.add('Laxmi');
        c1 = strSet.containsAll(strList);
        System.debug(c1);
        
        //containsAll setToCompare demo
        strSet2.add('Bhagya');
        strSet2.add('Laxmi');
        c2 = strSet.containsAll(strSet2);
        System.debug(c2);
        
     // List Demo for retreiving records from an object with SOQL query   
        List<Account> accList = [SELECT ID, Name FROM Account LIMIT 5];
        System.debug('Accounts from the List : '+ accList);
        
        //Map Demo
        Map<Integer,String> intStrMap = new Map<Integer,String>();
        Map<Integer,String> intStrMap2 = new Map<Integer,String>();
        List<String> strList3 = new List<String>();
        Set<Integer> intSet3 = new Set<Integer>();
        intStrMap.put(1,'A');
        System.debug('intStrMap'+intStrMap);
        intStrMap2.putAll(intStrMap);
        System.debug('intStrMap2'+intStrMap2);
        strList3 = intStrMap2.values();
        System.debug('List of values from the Map '+strList3);
        intSet3 = intStrMap2.keySet();
        System.debug('Set of keys from the Map '+intSet3);
        
        Boolean a1;
        a1=intStrMap2.containsKey(1);
        System.debug(a1);
        
        Map<ID, Account> IdToAccountMap = new Map<ID, Account>([SELECT Id, Name from Account LIMIT 1]);
 		System.debug(IdToAccountMap);
    }
}