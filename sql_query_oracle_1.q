https://www.hackerrank.com/challenges/weather-observation-station-11

* Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
* Your result cannot contain duplicates.

My solution:

SELECT distinct CITY FROM STATION WHERE not LOWER(SUBSTR(CITY,1,1)) in ('a','e','i','o','u') or not LOWER(SUBSTR(CITY,-1,1)) in ('a','e','i','o','u');
