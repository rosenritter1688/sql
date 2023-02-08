Consider below simple table:

Name     Salary
---------------
abc     100000
bcd     1000000
efg     40000
ghi     500000

'
Below is simple query to find the employee whose salary is highest.
'
SELECT name, MAX(salary) as salary FROM employee 
'
We can nest the above query to find the second largest salary.
'


SELECT name, MAX(salary) AS salary
  FROM employee
 WHERE salary < (SELECT MAX(salary)
                 FROM employee); 


--There are other ways also as suggested by RajnishKrJha.
SELECT name, MAX(salary) AS salary 
FROM employee 
WHERE salary IN
(SELECT salary FROM employee MINUS SELECT MAX(salary) 
FROM employee);


SELECT name, MAX(salary) AS salary 
FROM employee 
WHERE salary  (SELECT MAX(salary) 
FROM employee);

--One way as suggested by Arka Poddar.
'IN SQL Server using Common Table Expression or CTE, we can find the second highest salary:'

WITH T AS
(
SELECT *
   DENSE_RANK() OVER (ORDER BY Salary Desc) AS Rnk
FROM Employees
)
SELECT Name
FROM T
WHERE Rnk=2;