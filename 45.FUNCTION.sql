--!建好的function 放在/可程式性 函數 純量值函式

IF OBJECT_ID (N'dbo. myFunx ', N'FN') IS NOT NULL
 DROP FUNCTION ufnGetInventoryStock;
GO
CREATE FUNCTION dbo.myFunx(@ProductID int )
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