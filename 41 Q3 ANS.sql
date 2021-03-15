drop function addSex
create function addSex(@std_id char(20)) returns varchar(20)
as
begin
  declare @retStr varchar(20);
  declare @xsex bit;
  select @xsex=sex from student where std_id = Trim(@std_id);
  if @xsex = 1
     select @retStr = Trim(@std_id)
  else
     select @retStr = Trim(@std_id) + '(女)'

 

  return @retStr;

 

end;

 


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