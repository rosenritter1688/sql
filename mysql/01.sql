
create table employees (
    Emp_name VARCHAR(25),
    Emp_ID int PRIMARY KEY,
    Age INT,
    Gender CHAR(1),
    Doj date,
    Dept VARCHAR(25),
    City VARCHAR(15),
    Salary float
)
DESCRIBE employees;

insert into employees values
    ('Matthew', 10000, 30, 'M', '2000-10-17', 'Marketing', 'Chicago', 40000),
    ('Betty', 10001, 39, 'M', '2000-08-06', 'PR', 'Los Angeles', 100000),
    ('Nancy', 10002, 43, 'M', '2000-03-04', 'PR', 'Chicago', 50000), 
    ('Daniel', 10003, 19, 'M', '2000-09-19', 'Finance', 'San Antonio', 70000), 
    ('Lisa', 10004, 42, 'F', '2000-03-17', 'IT', 'Phoenix', 60000),
    ('Christopher', 10005, 55, 'M', '2000-12-22', 'Operations management', 'Chicago', 70000), 
    ('Karen', 10006, 41, 'F', '2000-07-22', 'Finance', 'Houston', 70000), 
    ('Charles', 10007, 40, 'F', '2000-09-14', 'IT', 'Houston', 30000),
    ('Sarah', 10008, 66, 'M', '2000-04-01', 'Finance', 'Phoenix', 30000), 
    ('Thomas', 10009, 29, 'F', '2000-11-04', 'Operations management', 'Phoenix', 90000), 
    ('Jessica', 10010, 25, 'M', '2000-12-18', 'Finance', 'San Jose', 30000), 
    ('Joseph', 10011, 38, 'F', '2000-05-09', 'Human Resource', 'Dallas', 50000),
    ('Susan', 10012, 44, 'M', '2000-09-22', 'Operations management', 'Houston', 60000),
    ('Richard', 10013, 42, 'M', '2020-03-29', 'Human Resource', 'Chicago', 70000), 
    ('William', 10014, 40, 'M', '2002-08-30', 'Marketing', 'San Jose', 60000), 
    ('Barbara', 10015, 61, 'M', '2000-11-07', 'Finance', 'Philadelphia', 90000), ('David', 10016, 24, 'F', '1995-08-17', 'Finance', 'Houston', 70000), 
    ('Elizabeth', 10017, 18, 'F', '2000-04-17', 'IT', 'Los Angeles', 40000), 
    ('Linda', 10018, 31, 'F', '2000-08-08', 'IT', 'San Jose', 100000), 
    ('Michael', 10019, 34, 'M', '2000-03-17', 'Marketing', 'Dallas', 80000), 
    ('Jennifer', 10020, 61, 'F', '2010-07-14', 'PR', 'Chicago', 70000),
    ('John', 10021, 57, 'M', '2000-04-06', 'IT', 'San Diego', 100000), 
    ('Patricia', 10022, 21, 'M', '2000-02-10', 'PR', 'Chicago', 30000),
    ('Robert', 10023, 67, 'M', '2000-01-01', 'Marketing', 'San Antonio', 40000), 
    ('Mary', 10024, 70, 'M', '2000-03-11', 'Human Resource', 'San Diego', 100000), 
    ('James', 10025, 58, 'M', '2001-10-13', 'Human Resource', 'Philadelphia', 50000)
;
--! delete all rows in a table wo delete a TABLE

DELETE FROM employees;

show TABLES;
DESCRIBE employees

SELECT * from employees;

select COUNT(emp_name) from employees;

select DISTINCT city from employees;

--! find the average of age ACCESSIBLE
SELECT avg(age) FROM employees
--! find the average age of each department
--! then use group by 
SELECT dept, avg(age) as avg_age FROM employees
GROUP by Dept


--! round()
-- round up
-- 0 decimal round()
select dept, round(avg(age)) as avg_age
from employees
group by dept;
-- 2 decimals round(values, 2)
select dept, round(avg(age), 2 ) as avg_age
from employees
group by dept;


--! order by values
select dept, round(avg(age), 2 ) as avg_age
from employees
group by dept
ORDER BY avg_age DESC;

-- calculate total salary for each deptment
SELECT Dept, sum(salary) as total_salary FROM employees
GROUP by Dept
ORDER by total_salary DESC;

DESCRIBE employees;
-- calculate numbers of employees for each deptment
select dept, count(emp_id) as no_employees FROM employees
group by Dept
ORDER BY no_employees ;
/*
dept	no_employees
Operations management	3
Marketing	                            4
PR	                                            4
Human Resource	                4
IT	                                                5
Finance	                                    6
*/

select Dept, count(emp_name) as no_employees from employees
group by Dept
ORDER by no_employees;
/*
Dept	no_employees
Operations management	   3
Marketing	                                4
PR	                                                4
Human Resource	                    4
IT	                                                  5
Finance	                                        6
*/

select Dept, count(dept) as no_employees from employees
group by Dept
ORDER by no_employees;
--! summary count dept, emp_id, emp_name all the same

-- calculate total employees from different city
select count(emp_id) as numbers, city from employees
GROUP by city
order by count(emp_id) desc;

-- calculate the number of employees joined the company
select year(doj) as year_doj, count(emp_id) from employees
group by year_doj
order by year_doj;

year_doj	count(emp_id)
1995	1
2000	21
2001	1
2002	1
2010	1
2020	1

select year(doj) as year_doj, count(age) as no_employees
from employees
group by year_doj
order by year_doj;

year_doj	count(age)
1995	1
2000	21
2001	1
2002	1
2010	1
2020	1

select year(doj) as year_doj, count(geder) from employees
group by year_doj
order by year_doj;

---! change COLUMN_NAME]
alter TABLE employees
RENAME column geder to gender;

--! using group by to join tables together
create table sales (
    product_id int,
    sell_price float,
    qty int,
    state VARCHAR(20)
)


show databases;

use sql_intro;
show tables;
describe sales;
'product_id', 'int', 'YES', '', NULL, ''
'sell_price', 'float', 'YES', '', NULL, ''
'qty', 'int', 'YES', '', NULL, ''
'state', 'varchar(20)', 'YES', '', NULL, ''

insert into sales values 
(121,320.0,3,"california"),
(121,320.0,6,"taxas"),
(121,320.0,4,"alaska"),
(123,290.0,2,"taxas"),
(123,290.0,7,"california"),
(123,290.0,4,"washington"),
(121,320.0,7,"ohio"),
(121,320.0,2,"Arizona"),
(123,290.0,8,"colorado");

select * from sales;

select * from employees;

-- calculate the total sells amount of 2 products
-- sum( sell_price * qty )    > we can do the calculation of 2 columns then sum up

select product_id, sum(sell_price * qty) as total_sales_amount
from sales
group by product_id;

create table c_product
( 
product_id int,
cost_price float
);

show tables;
describe c_product;

show databases;
use sql_intro;
show tables;

describe c_product;

--! pracrice for joint

insert into Customer
values (1,1,"Bob Smith"),
		     (2,1,"Sally Smith"),
		    (3,2,"Tom Smith"),
		    (4,Null,"Mary Smith");

select * from Customer;

CustomerId	CityId	Customer_Name
1	1	Bob Smith
2	1	Sally Smith
3	2	Tom Smith
4	null	Mary Smith

CREATE TABLE City(
    CityId int,
    CityName VARCHAR(30)
)


show tables;

insert into City
values(1,"Kansas City"),
            (2,"New York"),
            (3,"Houston")

select * from City;

CityId	CityName
1	Kansas City
2	New York
3	Houston

-- inner STRAIGHT_JOIN
