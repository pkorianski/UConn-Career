// This program will help crack passwords and convert from hash to Hex

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.MessageDigest;
import java.io.File;
import java.util.Scanner;

public class stage4 {

  static String passHash = "6af51980d8dc0343ab8cd2acee45ce98d3a3db95b1eed66f634511da19220f83";

  public static void main(String[] args) throws UnsupportedEncodingException, NoSuchAlgorithmException
  {
    try {
            System.out.print("Enter the file name with extension : ");

            Scanner input = new Scanner(System.in);

            File file = new File(input.nextLine());

            input = new Scanner(file);

            while (input.hasNextLine()) {
              String word = input.nextLine();
                for(int i=0; i<10; i++){
                  String randNumText = word + Integer.toString(i);
                  String dicHash = hshToHex(randNumText);
                  if(passHash.equals(dicHash)){
                    System.out.println(randNumText);
                  }
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
