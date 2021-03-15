--! this works but shows no result

declare temp cursor for
select std_id , course_id, rcd 
from record 
where course_id ='C001' and rcd < 60;

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