--FORMAT ( value, format [, culture ] )

--宣告 DataTime 型態的變數 @myDate, 並立即用系統函數 GetDate 取得現在時間


DECLARE @myDate DATETIME = GETDATE();
SELECT format( @myDate, 'yy/mm/dd') as yymmdd , 
       format( @myDate, 'yyyy/mm/dd') as yyyymmdd,
       format(1234567890.123, '#,###.###') as 逗號區分和小數點三位, 
	   format(12345, '0,000,000') as 逗號區分


yymmdd	    yyyymmdd	逗號區分和小數點三位	逗號區分
21/41/24	2021/41/24	1,234,567,890.123   	0,012,345