/* https://www.codewars.com/kata/5848565e273af816fb000449/java
Encrypt this!

You want to create secret messages which can be deciphered by the Decipher this! kata. Here are the conditions:

    Your message is a string containing space separated words.
    You need to encrypt each word in the message using the following rules:
        The first letter needs to be converted to its ASCII code.
        The second letter needs to be switched with the last letter
    Keepin' it simple: There are no special characters in input.

Example:
Kata.encryptThis("hello world") => "104olle 119drlo"
*/

public class Kata {
    public static String encryptThis(String text) {
      if(text.length() < 1) return text;
      StringBuilder sb = new StringBuilder();  
      for (String word: text.split(" ")) {
        StringBuilder sbw = new StringBuilder(word);
        if (word.length() >= 3) {
          sbw.setCharAt(1, word.charAt(word.length() - 1));
          sbw.setCharAt(word.length() - 1, word.charAt(1));
        }
        sbw.replace(0,1,String.valueOf((int)word.charAt(0)));
        sbw.append(" ");
        sb.append(sbw);
      }
      sb.replace(sb.length() - 1, sb.length(), "");
      return sb.toString();
    }
}
