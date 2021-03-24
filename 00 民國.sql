select year(getdate())
--2021

declare @month int
--declare @year int
set @month=year(getdate())
select @month -1911
--110
select convert(int,year(getdate())) - 1911
--110



DECLARE @month nvarchar
SELECT @month=month(getdate())
select @month
--3

DECLARE @year INT
SELECT @year=year(getdate()) -1911
PRINT @year
--110

declare @asd
datetime = getdate();
select convert(int,FORMAT(@asd, 'yyyy')) - 1911
--if dont understand see the sample delow
/*
DECLARE @myDate 
DATETIME = GETDATE();
--set @myTime = GETDATE() ---> cant do it in this way
SELECT format(@myDate, 'yy/mm/dd') 
--21/53/13
SELECT format(@myDate, 'yyyy/mm/dd')
--2021/53/13
*/



-->sample 3
IF DATENAME(weekday, GETDATE()) IN (N'Saturday', N'Sunday')
	SELECT ' Weekend';
ELSE
	SELECT  ' Weekday';