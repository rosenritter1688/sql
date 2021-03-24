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