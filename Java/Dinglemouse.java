// https://www.codewars.com/kata/57feb00f08d102352400026e/java

/*
You notice that each flap character is on some kind of a rotor and the order of characters on each rotor is:
ABCDEFGHIJKLMNOPQRSTUVWXYZ ?!@#&()|<>.:=-+*/0123456789

And after a long while you deduce that the display works like this:
    Starting from the left, all rotors (from the current one to the end of the line) flap together until the left-most rotor character is correct.
    Then the mechanism advances by 1 rotor to the right...
    ...REPEAT this rotor procedure until the whole line is updated
    ...REPEAT this line procedure from top to bottom until the whole display is updated

Kata Task

Given the initial display lines and the rotor moves for each line, determine what the board will say after it has been fully updated.
For your convenience the characters of each rotor are in the pre-loaded constant ALPHABET which is a string.
*/

class Dinglemouse {
  
  private static final String ALPHABET = Preloaded.ALPHABET;
  private static final int P = ALPHABET.length();
  
  public static String[] flapDisplay(final String[] lines, final int[][] rotors) {
    int N = lines.length; // number of lines to operate
    String[] result = new String[N];
    for(int i = 0; i < N; ++i) {
      StringBuilder sb = new StringBuilder();
      int k = 0;
      for(int j = 0; j < lines[i].length(); ++j) {
        k += rotors[i][j];
        sb.append(ALPHABET.charAt((ALPHABET.indexOf(lines[i].charAt(j)) + k) % P));
      }
      result[i] = sb.toString();
    }
    return result;
  }
  
} 
