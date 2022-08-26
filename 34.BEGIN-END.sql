--@區域變數,@@全域變數/系統變數
--! #temp  and ##temp is the same logic
DECLARE @myINT int;
SET @myINT = 100;
WHILE @myINT > 0
BEGIN                            --like GO  分區CODING的區塊
	print @myINT;
	set @myINT = @myINT -1;
END;