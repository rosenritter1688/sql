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

--! NOT IN

SELECT * 
FROM student
WHERE age NOT in (17,18)

--RESULT
/*
ROLL_NO NAME       ADDRESS    PHONE      AGE
------- ---------- ---------- ---------- ----
3       sujit      rohtak     XXXXXXX    20
4       suresh     delhi      XXXXXXX    16
6       testing    xxxxx      xxxxx      30
8       PRATIK     NULL       NULL       19
8       NIRAJ      NOIDA      XXXXXXXXXX 19
9       SOMESH     ROHTAK     XXXXXXXXXX 20
*/