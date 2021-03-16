--! AND Operator : This operators displays only those records 
--! where both the conditions condition1 and condition2 evaluates to True.

--basic syntax 
/*
SELECT * 
FROM table_name 
WHERE condition1 AND condition2 AND ...conditionN;

table_name: name of the table
condition1,2,..N : first condition, second condition and so on
*/

sample TABLE

ROLL_NO NAME       ADDRESS    PHONE      AGE
------- ---------- ---------- ---------- ----
1       Ram        delhi      XXXXXXX    18
2       Ramesh     gurgaon    XXXXXXX    17
3       sujit      rohtak     XXXXXXX    20
4       suresh     delhi      XXXXXXX    16
6       testing    xxxxx      xxxxx      30
8       PRATIK     NULL       NULL       19
7       SOUVIK     DUMDUM     XXXXXXXXXX 18
8       NIRAJ      NOIDA      XXXXXXXXXX 19
9       SOMESH     ROHTAK     XXXXXXXXXX 20
10      sase       delhi      NULL       18

--sample code

SELECT * 
FROM student
WHERE address = 'delhi' AND age = 18;
--RESULT
ROLL_NO NAME       ADDRESS    PHONE      AGE
------- ---------- ---------- ---------- ----
1       Ram        delhi      XXXXXXX    18
10      sase       delhi      NULL       18

--! multiple AND

SELECT * 
FROM student
WHERE address = 'delhi' 
      AND age = '18' 
      AND name like '_a%';

--RESULT

ROLL_NO NAME       ADDRESS    PHONE      AGE
------- ---------- ---------- ---------- ----
1       Ram        delhi      XXXXXXX    18
10      sase       delhi      NULL       18

--! look for null must use WHERE column IS NULL


SELECT * 
FROM student
WHERE address = 'delhi' 
      AND age = 18 
	  AND phone IS NULL;
       --!phone in NULL  --->will not work  