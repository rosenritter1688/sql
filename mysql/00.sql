/*
multi-lines comment
*/

-- alt + enter to execute

-- show all databases
show databases;

-- use database
use mysql;

-- show table
show tables;


-- get full detail of a table
describe component;
	-- field : shows the column name
    -- type : means data type

-- create database
create database sql_intro;

-- create table table_name (column_name data_type)
create table emp_details2 
	(Name varchar(25), 
    work_id int PRIMARY KEY,
	Age int,
	sex char(1), 
	doj date,
	city varchar(15),
	salary float);

-- !SQL Server大致上有char varchar nchar nvarchar text ntext 這6種可以選擇。
-- 不過較常用的4種char varchar nchar nvarchar的資料型態。
-- <point> 仔細觀察以上4種型態從字面上的差別只在有無var以及有無n
		-- ?var
        -- * 定長(沒有var):文字的長度固定
             -- 當輸入的數據長度沒有達到指定的長度時將自動以英文空格在其後面填充，讓長度達到相對應的長度。
		-- * 變長(有var):表示是實際存儲空間是變長的
			 -- 也就是說當輸入的數據長度沒有達到指定的長度時不會在後面填充空格。
             -- (不過text所存儲的也是可變長的)。
		/* example
        rocket1 char(10)
		rocket2 varchar(10)
		存入相同的資料「HiIU」
		rocket1 會自動在「HiIU」後面補空白，存滿10 Bytes。
		rocket2 會根據資料長度變更儲存空間，「HiIU」共四個英文字符，所以則存了4 Bytes。
        !使用varchar相對節省空間。
        */
        
        -- ?n 
        -- refers to unicode or non-unicode
        -- 在資料庫中，每個英文字符的儲存空間只需要一個 1 Byte，
        -- 但若是非英文字及符號，如中文、泰文、日文、韓文等非英文字符，則需要 2 Byte來儲存。
		-- 如果英文與中文同時存在，由於占用空間數不同，容易造成混亂，導致讀取出來的字符串是亂碼。
        -- 所以就要使用Unicode字符集(N)。

        -- * Unicode(有n):所有的文字都用2 Byte來儲存，
        -- 即使是英文字也是使用2 Byte來儲存，
        -- 就可以解決中英文字符集不兼容的問題。
        -- * 非Unicode(沒有n):文字是英文字符就是1 Byte;
        -- * 非英文字符就是使用2 Byte來儲存。
        -- ! 較佔儲存空間，但若儲存的資料不限於英文，
        -- ! 建議都以n開頭的欄位型態為主，避免亂碼。

-- summay
-- 有var的:在存不固定長度的資料時，較省空間。
-- 有n的:支援Unicode，不過儲存的資料會大兩倍(全部都英文字的話啦)。
/*
char 存資料有固定長度，並且都為英文數字。
nchar 存資料有固定長度，但不確定是否都是英文數字。
varchar 存資料沒有固定長度，並且都為英文數字。
nvarchar 存資料沒有固定長度，且不確定是否皆為英文數字。
*/


-- delete table
DROP TABLE;



show tables;
describe emp_details;



-- show all users
select * from mysql.user;

--
SELECT user,authentication_string,plugin,host FROM mysql.user;
select user, authentication_string, plugin from mysql.user;

/*
plugin代表密碼方式有:auth_socket和mysql_native_password
接著把root的auth_socket換成mysql_native_password
*/

-- change password
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

-- after changing password need to restart and take effect
FLUSH PRIVILEGES;


-- 倒著順序查看user表格的欄位:
desc user;

-- insert data into table

INSERT INTO emp_details
VALUES ("Jimmy", 35, "M", "2005-05-30", "Chicago", 70000),
	            ("Shane", 30, "M", "1999-06-25", "Seattle", 55000),
                ("Marry", 28, "F", "2009-03-10", "Boston", 62000),
                ("Dwayne", 37, "M", "2011-07-12", "Austin", 57000),
	            ("Sara", 32, "F", "2017-10-27", "New York", 72000),
	            ("Ammy", 35, "F", "2014-12-20", "Seattle", 80000);

-- getting data from table emp_details
SELECT * FROM emp_deatils;

/*  result

'Jimmy', '35', 'M', '2005-05-30', 'Chicago', '70000'
'Shane', '30', 'M', '1999-06-25', 'Seattle', '55000'
'Marry', '28', 'F', '2009-03-10', 'Boston', '62000'
'Dwayne', '37', 'M', '2011-07-12', 'Austin', '57000'
'Sara', '32', 'F', '2017-10-27', 'New York', '72000'
'Ammy', '35', 'F', '2014-12-20', 'Seattle', '80000'
'Robbin', '30', 'F', '1992-05-27', 'New York', '66666700'

*/

-- if wanna see distincted (not repeated) data from a column
SELECT DISTINCT * FROM emp_details;

/*
'Chicago'
'Seattle'
'Boston'
'Austin'
'New York'
*/

--* insert values vs  insert value
-- its just readability issue only, all works the same


-- delete row from table
delete from emp_details where name = 'Robbin'; 
                             -- its not capital sensitive so its ok to type name instead of Name


-- count 
-- exp. counting how many employees are in the data bases
                           
                           -- name is the column name
SELECT count(name) FROM emp_details;
-- * giving alias name for the column of the search result, to rename count(name) column name into no_of_emp
/*
# count(name)
  '6'
*/
SELECT count(name) as no_of_emp FROM emp_details;
/*
# no_of_emp
  '6'
  */
# here
--! SUM

select sum(salary) from emp_details;

--! AVG  average

SELECT AVG(salary) from emp_details;

--! just show selected COLUMNs
SELECT name, age, city from emp_details;

--! WHERE
-- filter table with specific condition

-- integer comparison
-- exp: finding employees with age > 30
SELECT * from emp_details
WHERE Age > 30;


-- find string
SELECT name, sex, city FROM emp_details
where sex = "F";

-- there is no capital SENSITIVE 
-- so chicago is ok 
-- in data is Chicago 
SELECT * FROM emp_details WHERE
city = "chicago" or city = "austin";   

--* in 
-- for multiple string CONDITION
SELECT * FROM emp_details WHERE
city in ("chicago", "austin");

--* between __ and __ ( like range)
SELECT * FROM emp_details WHERE
doj BETWEEN "2000-01-01" and "2010-12-31"


select * from emp_details 
where age
between 28 and 30;
/*
Name	Age	sex	doj	city	salary
Shane	30	M	Fri Jun 25 1999 00:00:00 GMT+0800 (Taipei Standard Time)	Seattle	55000
Marry	28	F	Tue Mar 10 2009 00:00:00 GMT+0800 (Taipei Standard Time)	Boston	62000
*/

--* and
-- two conditions

SELECT * from emp_details where
age > 30 and sex = "m"

--* GROUP BY
-- groups records into summary rows and returns one record for each group
-- exp calculate the total salary by gender
select sex, sum(salary) as total_salary from emp_details
GROUP BY sex ;
/* synax:
select column_nam
from TABLE_NAME
where CONDITION
group by column_names
order by ASC or DESC
*/



--* ASC , DESC
-- sort order by ASC , DESC
-- ASC is by default
select * FROM emp_details
ORDER BY salary;


select sex , avg(salary) as avg_salary from emp_details
GROUP BY sex
ORDER BY avg_salary DESC;

--! using select to do some calculation
select (10+10) as sum

select (20 - 12) as subtract;

--! length()
-- check how many letters

select length("india") as length_characters;

--! repeat()
                                            -- repeat 3 times
SELECT REPEAT("TW", 3)

--! upper()
SELECT upper("india")

--! lower()
SELECT lower("Tw")

--* CURRENT_DATE() , curdate(), now()   
-- currrent date with time zone
SELECT CURRENT_DATE()
-- curdate() as same as current_date()
SELECT curdate()

--* get day, from CURRENT_DATE() , curdate(), now() 
select day(curdate())
select MONTH(CURRENT_DATE())
select YEAR(CURRENT_DATE())

