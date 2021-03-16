--! Copying specific rows from a table: 
--! We can copy specific rows from a table to insert into another table 
--! by using WHERE clause with the SELECT statement. 
--! We have to provide appropriate condition in the WHERE clause to select specific rows.


INSERT INTO table1 
SELECT * FROM table2 
WHERE condition;

Table2: LateralStudent

ROLL_NO	NAME	ADDRESS	PHONE	Age
7	SOUVIK	DUMDUM	XXXXXXXXXX	18
8	NIRAJ	NOIDA	XXXXXXXXXX	19
9	SOMESH	ROHTAK	XXXXXXXXXX	20

/* insert records to newly createed table 
insert into LateralStudent
values(7,'SOUVIK','DUMDUM','XXXXXXXXXX',18),
      (8,'NIRAJ','NOIDA','XXXXXXXXXX',19),
      (9,'SOMESH','ROHTAK','XXXXXXXXXX',20)
*/

INSERT INTO student
SELECT * 
FROM LateralStudent
WHERE roll_no = 7;
--WHERE roll_no BETWEEN 7 and 8;
--WHERE roll_no in (7,8)
