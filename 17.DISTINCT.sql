SQL | Distinct Clause
Difficulty Level : Basic
'
The distinct keyword is used in conjunction with select keyword. 
It is helpful when there is a need of avoiding duplicate values present in any specific columns/table. 
When we use distinct keyword only the unique values are fetched. 
'
--Syntax : 

SELECT DISTINCT column1, column2 
FROM table_name 
column1, column2 : Names of the fields of the table.

table_name : Table from where we want to fetch the records.
'
This query will return all the unique combinations of rows in the table with fields column1, column2. 
'


--! NOTE: If distinct keyword is used with multiple columns, the distinct combination is displayed in the result set. 

--Table – Student

ROLL_NO	NAME	ADDRESS	PHONE	AGE
1	RAM	DELHI	XXXXXXXXXX	18
2	RAMESH	GURGAON	XXXXXXXXXX	18
3	SUJIT	ROHTAK	XXXXXXXXXX	20
4	SURESH	DELHI	XXXXXXXXXX	18
3	SUJIT	ROHTAK	XXXXXXXXXX	20
2	RAMESH	GURGAON	XXXXXXXXXX	18

--Queries

-- To fetch unique names from the NAME field –
 
SELECT DISTINCT NAME 
FROM Student;

--Output : 

NAME
Ram
RAMESH
SUJIT
SURESH

--? To fetch a unique combination of rows from the whole table –

SELECT DISTINCT * 
FROM Student;
--Output : 

ROLL_NO	NAME	ADDRESS	PHONE   	Age
1   	Ram	    Delhi	XXXXXXXXXX	18
2	    RAMESH	GURGAON	XXXXXXXXXX	18
3	    SUJIT	ROHTAK	XXXXXXXXXX	20
4   	SURESH	Delhi	XXXXXXXXXX	18
--! Note : Without the keyword distinct in both the above examples 6 records would have been fetched instead of 4, 
--! since in the original table there are 6 records with the duplicate values.