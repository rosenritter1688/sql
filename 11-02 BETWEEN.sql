-----LINE 31!!!!!!!!!!!!!!!!!
BETWEEN
'
The SQL BETWEEN condition allows you to easily test if an expression is within a range of values (inclusive). 
The values can be text, date, or numbers. It can be used in a SELECT, INSERT, UPDATE, or DELETE statement. 
The SQL BETWEEN Condition will return the records where expression is within the range of value1 and value2.
'
--Syntax:

SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;


Using BETWEEN with Numeric Values:
'
List all the Employee Fname, Lname who is having salary between 30000 and 45000.
'

SELECT Fname, Lname
FROM Employee
WHERE Salary
BETWEEN 30000 AND 45000;


--example
select std_id, count(*) as counting,SUM(rcd),AVG(rcd)  -- count(*)計算有出現幾次
from Record
GROUP BY std_id                          -- 把一樣的std_id弄在同一組
HAVING AVG(rcd) between 55 and 59 
-->dont know why must use having --! coz
--! group by use having
--! where is used for coloumn 


Using BETWEEN with Date Values ( like Date of Birth ):
'
Find all the Employee having Date of Birth Between 01-01-1985 and 12-12-1990.
'
SELECT Fname, Lname
FROM Employee
where DOB
BETWEEN '1985-01-01' AND '1990-12-30';


Using NOT operator with BETWEEN
'
Find all the Employee name whose salary is not in the range of 30000 and 45000.
'
SELECT Fname, Lname
FROM Emplyoee
WHERE Salary
NOT BETWEEN 30000 AND 45000;