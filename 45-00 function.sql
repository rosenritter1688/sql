drop function addSex

create function addSex(@std_id char(20)) returns varchar(20)
as
begin
  declare @retStr varchar(20);
  declare @xsex varchar(20);
  select @xsex=sex 
  from student 
  where std_id = Trim(@std_id);
  if @xsex = 'M'
     select @retStr = Trim(@std_id)
  else
     select @retStr = Trim(@std_id) + '(女)'
  return @retStr;
end;
/*
select * from student2
1	Z8904025	陳慧穎	F	CL	R001	NONE
2	Z9903014	吳汎兒	F	CL	R001	C001
*/
select dbo.addSex(std_id),   --!use function on std_id
       std_name,
	    sex,
	    dep_id,
	    religion,
	    club_id
from student2
 


drop function addFail
create function addFail(@rcd int) returns varchar(20)
as
begin
  declare @retStr varchar(20);
  

 

  if @rcd >=60
     select @retStr = convert(char(3),@rcd)
  else
     select @retStr = convert(char(3),@rcd) + 'Fail'

 

  return @retStr;

 

end;

 


select dbo.addSex(std_id), course_id, dbo.addFail(rcd) from record

 


select std_name+'---' from student