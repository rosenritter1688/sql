--! calculate the total members of each dep_id
--* FROM
/*
select * from Department2
Dep_Id Dep_Name
------ ---------- 
CL     中國文學系 
*/
--* TO
/*
select * from Department2
Dep_Id Dep_Name   students
------ ---------- -----------
CL     中國文學系      22
CS     資訊工程學系     22
ANTH   人類學研究所     13
LS     生命科學系      14
PHYS   物理學系       12
JMU    音樂學系       17
*/



--! add students column

alter table department2
add students int

/*
select * from #temp
dep_id     students
---------- -----------
ANTH       13

select * from department2
Dep_Id Dep_Name   students
------ ---------- -----------
CL     中國文學系      NULL




drop table #temp
--! create temp table
create table #temp(dep_id char(10),students int)
insert into #temp(dep_id,students)
select dep_id, count(*)
from student
group by dep_id





select * from student
Std_Id     Std_Name   Sex        Dep_Id     Religion   Club_Id
---------- ---------- ---------- ---------- ---------- ----------
Z8904025   陳慧穎        F          CL         R001       NONE
*/

update department2 
set department2.students = t.students
from department2, #temp t
where d.dep_id =t.dep_id
/*
select * from Department2
Dep_Id Dep_Name   students
------ ---------- -----------
CL     中國文學系      22
CS     資訊工程學系     22
ANTH   人類學研究所     13
LS     生命科學系      14
PHYS   物理學系       12
JMU    音樂學系       17
*/