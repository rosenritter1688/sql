'
WHERE keyword is used for fetching filtered data in a result set.

> It is used to fetch data according to a particular criteria.
> WHERE keyword can also be used to filter data by matching patterns.
'

--! criterion noun [ C ]
--criterionは単数形で、criteriaが複数形です
'
UK  /kraɪˈtɪə.ri.ən/ US  /kraɪˈtɪr.i.ən/
plural criteria UK  /-ri.ə / US  /-ˈtɪr.i.ə /
 
a standard by which you judge, decide about, or deal with something
（作出評判、決定或處理的）標準，準則
The Health Service should not be judged by financial criteria alone.
公共醫療衛生服務不應僅僅以財務狀況的好壞爲標準來評判。
'

--Basic Syntax:
SELECT column1,column2 
FROM table_name   -->line 26~34
WHERE column_name operator value;

operator	description
>	Greater Than
>=	Greater than or Equal to
<	Less Than
<=	Less than or Equal to
=	Equal to
<>	Not Equal to
BETWEEN	In an inclusive Range
LIKE	Search for a pattern
IN	To specify multiple possible values for a column

--example
'To fetch record of students with age equal to 20'
SELECT * FROM Student WHERE Age=20;

--example 2
'To fetch Name and Address of students with ROLL_NO greater than 3'
SELECT ROLL_NO,NAME,ADDRESS 
FROM Student 
WHERE ROLL_NO > 3;