drop table #temp

create table #temp(course_id nvarchar(10),students int)
insert into #temp(course_id,students)
select Course_Id,count(*)
from record
group by Course_Id

select * from #temp


select * from course

update course
set course.students = #temp.students
from course, #temp
where course.course_id = #temp.course_id