/*
--! for practice need data
create DATABASE student;

CREATE TABLE student
(
    ROLL_NO varchar(3),
    NAME varchar(10),
    ADDRESS varchar(10),
    PHONE varchar(10),
    AGE varchar(2)
);

INSERT INTO student (ROLL_NO,NAME,ADDRESS,PHONE,AGE)
VALUES('1','Ram','delhi','XXXXXXX','18'),('2','Ramesh','gurgaon','XXXXXXX','17'),('3','sujit','rohtak','XXXXXXX','20'),('4','suresh','delhi','XXXXXXX','16');

*/

--? sample table
/*
ROLL_NO NAME       ADDRESS    PHONE      AGE
------- ---------- ---------- ---------- ----
1       Ram        delhi      XXXXXXX    18
2       Ramesh     gurgaon    XXXXXXX    17
3       sujit      rohtak     XXXXXXX    20
4       suresh     delhi      XXXXXXX    16

*/

--? basic syntax

--SELECT COLUMN_1,COLUMN_2 FROM table_name
-->                             table_name : from where we want to fetch

--? fetch entire table
--SELECT * from student


--? fetch column ROLL_NO,NAME,AGE from table student
SELECT roll_no,name,age  --! not using capital letter is ok but the talbe that shows us wont be capital letter too
from student
/* RESULT
roll_no name       age
------- ---------- ----
1       Ram        18
2       Ramesh     17
3       sujit      20
4       suresh     16

(4 個資料列受到影響)
*/



