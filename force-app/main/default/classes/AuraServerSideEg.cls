public with sharing class AuraServerSideEg {
 @AuraEnabled
 public static String serverEcho (String firstName) 
 {
  return('Hello from the server'+ firstName); 
 }

}