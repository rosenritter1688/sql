/*
select * from student
Std_Id     Std_Name   Sex        Dep_Id     Religion   Club_Id
---------- ---------- ---------- ---------- ---------- ----------
Z8904025   陳慧穎        F          CL         R001       NONE
select * from record 
Course_Id  Std_Id     Rcd
---------- ---------- ----------------------
A1045340   Z8613373   71
*/

declare temp cursor for
select std_id , course_id, rcd 
from record 
where course_id ='A1045340' and rcd > 60;

declare @std_id nchar(10);
declare @course_id nchar(10);
declare @rcd int;

open temp
fetch next from temp into @std_id, @course_id, @rcd
while(@@fetch_status !=-1)
begin
select @std_id, @course_id, @rcd;
fetch next from temp into @std_id, @course_id, @rcd;
end;
close temp;
deallocate temp;