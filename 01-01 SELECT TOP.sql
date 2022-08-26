'SELECT TOP clause is used to fetch limited number of rows from a database. 
This clause is very useful while dealing with large databases.'

-- Basic Syntax:
SELECT TOP value column1,column2 
FROM table_name;


--Syntax using Percent

SELECT TOP value PERCENT column1,column2 
FROM table_name;

-- To fetch 50 percent of the total records from Student table.
SELECT TOP 50 PERCENT * 
FROM Student; 

--To fetch first two data set from Student table.
SELECT TOP 2 * 
FROM Student; 

--! NOTE: To get the same functionality on MySQL and Oracle databases there is a bit of difference in the basic syntax;

--!Equivalent Syntaxes are as follows:

--? For MySQL databases:
SELECT column1,column2 
FROM table_name LIMIT value;

--? For Oracle databases:
SELECT column1,column2 
FROM table_name 
WHERE ROWNUM <= value;

