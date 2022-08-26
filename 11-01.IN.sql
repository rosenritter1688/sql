IN

IN operator allows you to easily test if the expression matches any value in the list of values. 
It is used to remove the need of multiple OR condition in SELECT, INSERT, UPDATE or DELETE.
You can also use NOT IN to exclude the rows in your list.

Syntax:

SELECT column_name(s)
FROM table_name
WHERE column_name IN (list_of_values);

--example 
-- Find the Fname, Lname of the Employee table who have Salary equal to 30000, 40000 or 25000.
SELECT Fname, Lname
FROM Employee
WHERE Salary IN (30000, 40000, 25000);

'NOT IN'
'
Find the Fname, Lname of all the Employee who have Salary not equal to 25000 or 30000.
'
SELECT Fname, Lname
FROM Employee
WHERE Salary NOT IN (25000, 30000);