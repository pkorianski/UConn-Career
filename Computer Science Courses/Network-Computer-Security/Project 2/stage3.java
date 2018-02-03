// This program will help crack passwords and convert from hash to Hex

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.MessageDigest;
import java.io.File;
import java.util.Scanner;

public class stage3 {

  static String passHash = "371f7e4223809d8bce3d52f6a5358e47c4b57aa00cbe0a4d8b47d74f010dffa6";

  public static void main(String[] args) throws UnsupportedEncodingException, NoSuchAlgorithmException
  {
    try {
            System.out.print("Enter the file name with extension : ");

            Scanner input = new Scanner(System.in);
            File file = new File(input.nextLine());
            input = new Scanner(file);

            while (input.hasNextLine()) {
                String line = input.nextLine();
                String lineHash = hshToHex(line);
                if(lineHash.equals(passHash)){
                  System.out.println(line);
                }
            }
            input.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }


  }

  public static String hshToHex(String input) throws UnsupportedEncodingException, NoSuchAlgorithmException
  {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] mdbytes = md.digest(input.getBytes("US-ASCII"));
        StringBuffer hexString = new StringBuffer();
        for (int i=0; i<mdbytes.length;i++) {
          String hex=Integer.toHexString(0xff & mdbytes[i]);
          if(hex.length()==1) hexString.append('0');
          hexString.append(hex);
        }
                return hexString.toString();
  }

}
