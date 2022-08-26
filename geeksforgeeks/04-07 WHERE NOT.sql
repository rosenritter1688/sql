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


--! Combining AND, OR and NOT
--! You can also combine the AND, OR and NOT operators.
--Example:

SELECT *
FROM student
WHERE NOT age = 19
  AND NOT address = 'xxxxx'

--RESULT
/*
ROLL_NO NAME       ADDRESS    PHONE      AGE
------- ---------- ---------- ---------- ----
1       Ram        delhi      XXXXXXX    18
2       Ramesh     gurgaon    XXXXXXX    17
3       sujit      rohtak     XXXXXXX    20
4       suresh     delhi      XXXXXXX    16
7       SOUVIK     DUMDUM     XXXXXXXXXX 18
9       SOMESH     ROHTAK     XXXXXXXXXX 20
10      sase       delhi      NULL       18
*/