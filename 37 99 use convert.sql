--!常用系統函數  資料型態轉換
--? Convert (資料型態 , 資料) &  Cast (資料 as 資料型態)

-->sample 1
declare @i int
declare @j int
set @i = 1
while @i <= 9
begin
    set @j = 1
        while @j <= 9
        beginbh
        --!method 1 use convert
        print convert(char,@i) + ' x ' + convert(char, @j) + convert(char, @i) + ' = ' + convert(char, @i * @j); 
		--print 是 return 的動作
        --!method 2 use cast
        PRINT CAST(@i as char) + ' x ' + CAST(@j as char) + CAST(@i as char) + ' = ' + CAST(@i * @j as char);

        set @j = @j + 1;
        end;
set @i = @i + 1
end;


-->sample 2

declare @str varchar(10)
set @str = ' 12345 ';
select @str, cast (@str as int) + 1, convert (int, @str)+1