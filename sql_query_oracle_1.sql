/*
[1] https://www.hackerrank.com/challenges/weather-observation-station-11/problem
* Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
* Your result cannot contain duplicates.

My solution: */
SELECT distinct CITY FROM STATION
WHERE not LOWER(SUBSTR(CITY,1,1)) in ('a','e','i','o','u') or not LOWER(SUBSTR(CITY,-1,1)) in ('a','e','i','o','u');
/*
[2] https://www.hackerrank.com/challenges/more-than-75-marks/problem
*Query the Name of any student in STUDENTS who scored higher than Marks.
Order your output by the last three characters of each name.
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.),
secondary sort them by ascending ID.

My solution: */
SELECT Name FROM STUDENTS WHERE Marks > 75 ORDER BY SUBSTR(Name,-3,3), ID ASC;
/*
[3] https://www.hackerrank.com/challenges/salary-of-employees/problem
* Write a query that prints a list of employee names (i.e.: the name attribute) for employees
in Employee having a salary greater than per month who have been employees for less than months.
Sort your result by ascending employee_id.

My solution: */
SELECT name FROM Employee WHERE salary > 2000 AND months < 10 ORDER BY employee_id;
/*
[4] https://www.hackerrank.com/challenges/what-type-of-triangle/problem
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths.
Output one of the following statements for each record in the table:

Equilateral: It's a triangle with sides of equal length.
Isosceles: It's a triangle with sides of equal length.
Scalene: It's a triangle with sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.

My solution: */
 SELECT CASE
    WHEN A+B>C AND A+C>B AND B+C>A THEN
        CASE
            WHEN A=B AND B=C THEN 'Equilateral'
            WHEN A=B OR A=C OR B=C THEN 'Isosceles'
            ELSE 'Scalene'
        END
    ELSE 'Not A Triangle' END
FROM TRIANGLES;