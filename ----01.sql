create function myf (@instr char(30),@rcd int)
returns @outstr char(30)
begin
	select @outstr = @instr + '成績:' + covert(char(30)@rcd);
	returns @outstr;
end;

select dbo.myf(std_id) from student