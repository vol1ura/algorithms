// https://www.codewars.com/kata/59437bd7d8c9438fb5000004/java

/*
Introduction

There is a war and nobody knows - the alphabet war!
The letters hide in their nuclear shelters. The nuclear strikes hit the battlefield and killed a lot of them.
Task

Write a function that accepts battlefield string and returns letters that survived the nuclear strike.
* The battlefield string consists of only small letters, #,[ and ].
* The nuclear shelter is represented by square brackets []. The letters inside the square brackets represent letters inside the shelter.
* The # means a place where nuclear strike hit the battlefield. If there is at least one # on the battlefield, all letters outside of shelter die. When there is no any # on the battlefield, all letters survive (but do not expect such scenario too often ;-P ).
* The shelters have some durability. When 2 or more # hit close to the shelter, the shelter is destroyed and all letters inside evaporate. The 'close to the shelter' means on the ground between the shelter and the next shelter (or beginning/end of battlefield). The below samples make it clear for you.

Example

abde[fgh]ijk     => "abdefghijk"  (all letters survive because there is no # )
ab#de[fgh]ijk    => "fgh" (all letters outside die because there is a # )
ab#de[fgh]ij#k   => ""  (all letters dies, there are 2 # close to the shellter )
##abde[fgh]ijk   => ""  (all letters dies, there are 2 # close to the shellter )
*/

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AlphabetNuclearWar {

    public static String alphabetWar(String battlefield) {
      String blowup = "";
      if(battlefield.matches("(?d:.*#.*)")) {
        Pattern p = Pattern.compile("#|\\[\\w+\\]");
        Matcher m = p.matcher(battlefield);
        while(m.find()) {
          blowup += m.group();
        }
        battlefield = blowup.replaceAll("##\\[\\w+\\]|\\[\\w+](?=##)|#\\[\\w+\\](?=#)","");
      }
      return battlefield.replaceAll("[#\\[\\]]","");
    }
   
}
