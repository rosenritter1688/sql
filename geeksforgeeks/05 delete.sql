--! delete one
DELETE from course
WHERE credit = 5;

--sample table
/*
ROLL_NO NAME       ADDRESS    PHONE      AGE
------- ---------- ---------- ---------- ----
1       Ram        delhi      XXXXXXX    18
2       Ramesh     gurgaon    XXXXXXX    17
3       sujit      rohtak     XXXXXXX    20
4       suresh     delhi      XXXXXXX    16
5       testing    xxxxx      xxxxx      30
6       testing    xxxxx      xxxxx      30

*/
--!delete multiple records

DELETE FROM student
where CAST(age AS INT)
in (30,20)

/* add it back
insert into student(ROLL_no,name,address,phone,age)
VALUES (3,'sujit','rohtak','XXXXXXX','20'),(6,'testing','xxxxx','xxxxx','30')
*/


--! delete all records from a table
DELETE *
FROM student