Q2

drop function birth_date

create function birth_date(@xdate Datetime) returns varchar(20)
as
begin
  declare @str varchar(20);
  select @xdate = Birth 
  from student 
  where birth = @xdate;
  select @str = convert(varchar(20),(convert(int,format( @xdate, 'yyyy')) - 1911)) + '/' + convert(varchar(2),month(@xdate)) + '/' + convert(varchar(2),day(@xdate))
  return @str 
end;

select dbo.birth_date(birth) as birth
from student
