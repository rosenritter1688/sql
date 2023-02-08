--! Inserting all columns of a table: We can copy all the data of a table 
--! and insert into in a different table.
--syntax
INSERT INTO first_table 
SELECT * 
FROM second_table;



ROLL_NO NAME       ADDRESS    PHONE      AGE
------- ---------- ---------- ---------- ----
1       Ram        delhi      XXXXXXX    18
2       Ramesh     gurgaon    XXXXXXX    17
3       sujit      rohtak     XXXXXXX    20
4       suresh     delhi      XXXXXXX    16
6       testing    xxxxx      xxxxx      30
8       PRATIK     NULL       NULL       19
7       SOUVIK     DUMDUM     XXXXXXXXXX 18--> newly inseerted
8       NIRAJ      NOIDA      XXXXXXXXXX 19--> newly inseerted
9       SOMESH     ROHTAK     XXXXXXXXXX 20--> newly inseerted