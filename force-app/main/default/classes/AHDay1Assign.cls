public class AHDay1Assign 
{
    public static void sumOfEvenPlaces()
    {
	List<Integer> num = new List<Integer>();
    for (Integer n=1; n<=20; n++)
    {
       num.add(n); 
    }
	System.debug('Numbers stored: ' + num);
	Integer sum = 0;
	for (Integer i=1; i<num.size(); i++)
	{
    	if (Math.mod(i, 2)==0)
    	{
        sum = sum + num[i];  
    	}
	}
	System.debug('Sum of numbers at even places: ' + sum);
    }
}