DECLARE @month INT
SELECT @month=month(getdate())
if @month % 2 = 0
	select '偶數月'
else
	select '奇數月'

-->sample 2
IF 1 = 1
   PRINT 'Boolean_expression is true.'
ELSE
  PRINT 'Boolean_expression is false.' ;


-->sample 3
IF DATENAME(weekday, GETDATE()) IN (N'Saturday', N'Sunday')
	SELECT ' Weekend';
ELSE
	SELECT  ' Weekday';