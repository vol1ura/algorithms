[1] https://www.hackerrank.com/challenges/weather-observation-station-11/problem
* Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
* Your result cannot contain duplicates.

My solution:
SELECT distinct CITY FROM STATION WHERE not LOWER(SUBSTR(CITY,1,1)) in ('a','e','i','o','u') or not LOWER(SUBSTR(CITY,-1,1)) in ('a','e','i','o','u');

[2] https://www.hackerrank.com/challenges/more-than-75-marks/problem
*Query the Name of any student in STUDENTS who scored higher than Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

My solution:
SELECT Name FROM STUDENTS WHERE Marks > 75 ORDER BY SUBSTR(Name,-3,3), ID ASC;
