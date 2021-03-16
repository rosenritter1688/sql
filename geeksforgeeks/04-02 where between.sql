--? sample table
/*
ROLL_NO NAME       ADDRESS    PHONE      AGE
------- ---------- ---------- ---------- ----
1       Ram        delhi      XXXXXXX    18
2       Ramesh     gurgaon    XXXXXXX    17
3       sujit      rohtak     XXXXXXX    20
4       suresh     delhi      XXXXXXX    16

*/

--? sample code


BETWEEN	--In an inclusive Range

--! coz sample table colummn age is text so have to turn it into number
--! use CAST or convert
--! SELECT CAST(MyVarcharCol AS INT) FROM Table
--! SELECT CONVERT(INT, MyVarcharCol) FROM Table
SELECT *
FROM student
where CAST(age AS INT) BETWEEN 16 AND 18;
--RESULT
/*
ROLL_NO NAME       ADDRESS    PHONE      AGE
------- ---------- ---------- ---------- ----
1       Ram        delhi      XXXXXXX    18
2       Ramesh     gurgaon    XXXXXXX    17
4       suresh     delhi      XXXXXXX    16
*/

SELECT name, age
from student
where roll_no BETWEEN 3 AND 4

--RESULT
/*
name       age
---------- ----
sujit      20
suresh     16
*/