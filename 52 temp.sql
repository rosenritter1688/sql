create table #temp (
		Club_Id char(4),
		members int,
		Club_Name nchar(10)
		)

--sample 2

drop table #temp
create table #temp(dep_id char(10),students int)
insert into #temp(dep_id,students)
select dep_id, count(*)
from student
group by dep_id

update department set students = t.students
from department d, #temp t
where d.dep_id =t.dep_id

select * from department