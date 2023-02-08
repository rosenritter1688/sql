--! OR Operator: 
--! This operators displays the records 
--! where either one of the conditions evaluates to True. 
--! That is, either condition1 is True or condition2 is True.
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


--! OR Operator
/*
Basic Syntax:

SELECT * 
FROM table_name 
WHERE condition1 
   OR condition2 
   OR... conditionN;

table_name: name of the table
condition1,2,..N : first condition, second condition and so on
*/

SELECT *
FROM student
WHERE address IS NULL
   OR phone IS NULL;

-- RESULT
/*
ROLL_NO NAME       ADDRESS    PHONE      AGE
------- ---------- ---------- ---------- ----
8       PRATIK     NULL       NULL       19
10      sase       delhi      NULL       18
*/
