--!need to check what select really means at line 19
DECLARE @month INT
SELECT @month=month(getdate())
PRINT @month

--result
--3
DECLARE @month INT
SELECT @month=year(getdate())
PRINT @month

--result
--2021


DECLARE @month INT
SELECT @month=month(getdate())
if @month % 2 = 0
	select '偶數月'
else
	select '奇數月'




