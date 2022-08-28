--FORMAT ( value, format [, culture ] )

--宣告 DataTime 型態的變數 @myDate, 並立即用系統函數 GetDate 取得現在時間


DECLARE @myDate 
DATETIME = GETDATE();

SELECT format(@myDate, 'yy/mm/dd') 
--21/53/13
SELECT format(@myDate, 'yyyy/mm/dd')
--2021/53/13
SELECT format(1234567890.123, '#,###.###')
--1,234,567,890.123
SELECT format(12345, '0,000,000')
--0,012,345
SELECT format(654321, '000,000,000,000')
--000,000,654,321

