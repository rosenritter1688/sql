--!建好的function 放在/可程式性 函數 純量值函式
-->sample
IF OBJECT_ID (N'dbo. myFunxx ', N'FN') IS NOT NULL
 DROP FUNCTION ufnGetInventoryStock;
GO
CREATE FUNCTION dbo.myFunxx(@ProductID int )
RETURNS int /* 回傳的值的資料型態*/
AS --Returns the stock level for the product.
BEGIN
    DECLARE @ret int ;
SELECT @ret = SUM (p.Quantity)
FROM Production.ProductInventory p
WHERE p.ProductID = @ProductID
    AND p.LocationID = ' 6';
IF (@ret IS NULL)
    SET @ret = 0;
RETURN @ret;
END;
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