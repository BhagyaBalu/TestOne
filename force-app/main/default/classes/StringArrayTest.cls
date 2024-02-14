public class StringArrayTest {
    public static void generateStringArray(integer n){
        integer i=0;
        List<String> obj=new List<String>();
       for(i=0;i<n;i++)
        {
          obj.add('Test' +i);
          //String color1 = moreColors.get(0);
          //String color2 = moreColors[0];
         // System.assertEquals(color1, color2);
        }
        system.debug('(');
        for(i=0;i<n;i++)
        {
            system.debug(obj[i]);   
        }
        system.debug(')');
    }
}