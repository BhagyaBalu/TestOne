public class FutureClassEg 
{
    public void method1()
    {
        system.debug('method1 start');
        system.debug('method1 middle');
        method2();
        system.debug('method1 before end');
        system.debug('method1 end');
    }
    @Future
    public static void method2()
    {
        system.debug('method2 start');
        system.debug('method2 middle');
        system.debug('method2 before end');
        system.debug('method2 end');
    }
    
}