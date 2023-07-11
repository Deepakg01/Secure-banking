package source;

 

import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

public class HMAC {
    public String Thousand() {
		String thousand_id=null;
                try{
                KeyGenerator keyGen = KeyGenerator.getInstance("HmacMD5");
    SecretKey key = keyGen.generateKey();

    // Generate a key for the HMAC-SHA1 keyed-hashing algorithm 
    keyGen = KeyGenerator.getInstance("HmacSHA1");
    key = keyGen.generateKey();
    String ss=key+""+(int)Math.random()+""+(int)Math.random();
   // System.out.println(ss);
    String[] ss1=ss.split("@");
    thousand_id=ss1[1]+"1000";
    System.out.println(ss1[1]+"1000");
                }catch(Exception e)
                {
                    System.err.println(e);
                }
                		return thousand_id;
	}
    public String FiveHundred() {
		String fivehundred_id=null;
                try{
                KeyGenerator keyGen = KeyGenerator.getInstance("HmacMD5");
    SecretKey key = keyGen.generateKey();

    // Generate a key for the HMAC-SHA1 keyed-hashing algorithm
    keyGen = KeyGenerator.getInstance("HmacSHA1");
    key = keyGen.generateKey();
    String ss=key+""+(int)Math.random()+""+(int)Math.random();
   // System.out.println(ss);
    String[] ss1=ss.split("@");
    fivehundred_id=ss1[1]+"500";
    System.out.println(ss1[1]+"500");
                }catch(Exception e)
                {
                    System.err.println(e);
                }
                		return fivehundred_id;
	}
    public String Hundred() {
		String hundred_id=null;
                try{
                KeyGenerator keyGen = KeyGenerator.getInstance("HmacMD5");
    SecretKey key = keyGen.generateKey();

    // Generate a key for the HMAC-SHA1 keyed-hashing algorithm
    keyGen = KeyGenerator.getInstance("HmacSHA1");
    key = keyGen.generateKey();
    String ss=key+""+(int)Math.random()+""+(int)Math.random();
  //  System.out.println(ss);
    String[] ss1=ss.split("@");
    hundred_id=ss1[1]+"100";
    System.out.println(ss1[1]+"100");
                }catch(Exception e)
                {
                    System.err.println(e);
                }
                		return hundred_id;
	}
    
  public static void main(String[] argv) throws Exception {

    HMAC h=new HMAC();
    h.FiveHundred();
    h.Hundred();
    h.Thousand();
  }
}