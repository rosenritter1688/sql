WITH clause

Difficulty Level : Medium
 Last Updated : 05 Sep, 2019
The SQL WITH clause was introduced by Oracle in the Oracle 9i release 2 database. 
The SQL WITH clause allows you to give a sub-query block a name
(a process also called sub-query refactoring), which can be referenced in several places 
within the main SQL query.

The clause is used for defining a temporary relation such as the output of this temporary 
relation is available and is used by the query that is associated with the WITH clause.
Queries that have an associated WITH clause can also be written using 
nested sub-queries 
--! but doing so add more complexity to read/debug the SQL query.

--!WITH clause is not supported by all database system.
The name assigned to the sub-query is treated as though it was an inline view or table
The SQL WITH clause was introduced by Oracle in the Oracle 9i release 2 database.


--? Syntax:

--? WITH temporaryTable (averageValue) as
--?     (SELECT avg(Attr1)
--?     FROM Table),
--?     SELECT Attr1
--?     FROM Table
--?     WHERE Table.Attr1 > temporaryTable.averageValue;


/*
create TABLE Employee
(
    emplyee_id int,
    Name varchar(10),
    Salary int
)

INSERT into employee
values(100011,'Smith',50000),
      (100022,'Bill',94000),
      (100027,'Sam',70550),
      (100845,'Walden',80000),
      (115585,'Erik',60000),
      (1100070,'Kate',69000)

*/
--?sample table
employee_id  Name       Salary
----------- ---------- -----------
100011      Smith      50000
100022      Bill       94000
100027      Sam        70550
100845      Walden     80000
115585      Erik       60000
1100070     Kate       69000


WITH temporaryTable(averageValue) as (SELECT avg(Salary)from Employee)
    SELECT Employee_id,Name, Salary 
    FROM Employee, temporaryTable  --! 兩個table都要打
    WHERE Employee.Salary > temporaryTable.averageValue;

--RESULT
Employee_id Name       Salary
----------- ---------- -----------
100022      Bill       94000
100845      Walden     80000

就可以找出誰的薪水比平均高