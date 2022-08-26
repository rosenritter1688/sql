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
--? two ways of inserting records
-- 1 only values
INSERT INTO table_name 
VALUES (value1, value2, value3,…);

INSERT INTO Student 
VALUES (7,’HARSH’,’WEST BENGAL’,’XXXXXXXXXX’,’19’);

-- 2 column names and values both
INSERT INTO table_name (column1, column2, column3,..) 
VALUES ( value1, value2, value3,..);

INSERT INTO Student (ROLL_NO, NAME, Age)
VALUES (8,'PRATIK','19');

--result
ROLL_NO NAME       ADDRESS    PHONE      AGE
------- ---------- ---------- ---------- ----
1       Ram        delhi      XXXXXXX    18
2       Ramesh     gurgaon    XXXXXXX    17
3       sujit      rohtak     XXXXXXX    20
4       suresh     delhi      XXXXXXX    16
6       testing    xxxxx      xxxxx      30
8       PRATIK     NULL       NULL       19