declare @i int
declare @j int
set @i = 1
while @i <= 9
begin
    set @j = 1
        while @j <= 9
        begin
        --!method 1
        print convert(char,@i) + ' x ' + convert(char, @j) + convert(char, @i) + ' = ' + convert(char, @i * @j); 
		--print 是 return 的動作
        --!method 2
        --select @i ,' x ',@j ,' = ',@i * @j;
        set @j = @j + 1;
        end;
set @i = @i + 1
end;