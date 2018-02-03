// This program was created by Patrick Korianski
// It's purpose was to cycle through a file called "dictionary" and place a random number (0-9) anywhere within the each string
// Once placing a random number in a random spot in the string it finds the new words SHA256 hash and compares it to the Hash which was given to us by our professor
// If the two Hashes were equal, the password has been found and I could move to the next stage

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.io.FileNotFoundException;
import java.security.MessageDigest;
import java.io.File;
import java.util.Scanner;

public class stage5 {

  // SHA256 Hash given to us to figure out what password we need to find to get to the next stage
  static String passHash = "2958b6fb24a94cd6410ef5a47f1667966c764e515d2c85467660df2826672dbb";

  public static void main(String[] args) throws UnsupportedEncodingException, NoSuchAlgorithmException
  {
    try {
            // I put dictionary in the same directory as the stage5.java class and just typed "dictionary" when this is prompted
            System.out.print("Enter the file name: ");

            // Getting the users input data and then cycling through it until there is not nextLine
            Scanner input = new Scanner(System.in);
            File file = new File(input.nextLine());
            input = new Scanner(file);
            while (input.hasNextLine()){
              String word = input.nextLine();

              // This loops from numbers 0-9 || The inner for-loop cycles through the different indices the number could be placed within the string
              for(int i=0; i<10; i++){
                for(int x=0; x<word.length()+1; x++){
                   String newWord = word.substring(0,x) + Integer.toString(i) + word.substring(x);
                   String newHash = hshToHex(newWord);

                   // This checks if the current newWord with the random int is equal to the hash given to us in stage5
                   if(passHash.equals(newHash)){
                      System.out.println("Password = " + newWord);
                    }
                  }
                }

            }
        // Checks to make sure the user entered a valid file name
        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
        }
   }

  // Function given to us by our professor to calcuate the SHA256 hash of some string
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
