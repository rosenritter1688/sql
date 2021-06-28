CREATE TABLE SampleTable
(Id INT, CountryName NVARCHAR(100), ReadStatus TINYINT)
GO
INSERT INTO SampleTable ( Id, CountryName, ReadStatus)
Values (1, 'Germany', 0),
       (2, 'France', 0),
       (3, 'Italy', 0),
       (4, 'Netherlands', 0) ,
       (5, 'Poland', 0)

select * from SampleTable
/*
Id          CountryName                                                                                          ReadStatus
----------- ---------------------------------------------------------------------------------------------------- ----------
1           Germany                                                                                              0
2           France                                                                                               0
3           Italy                                                                                                0
4           Netherlands                                                                                          0
5           Poland 
*/
--------
DECLARE @Counter INT , 
        @MaxId INT, 
        @CountryName NVARCHAR(100)
SELECT @Counter = min(Id) , 
       @MaxId = max(Id) 
FROM SampleTable
 
WHILE(@Counter IS NOT NULL     ---while counter is not NULL and <= @MaxId
      AND @Counter <= @MaxId)
BEGIN
   SELECT @CountryName = CountryName  --@CountryName = column CountryName
   FROM SampleTable WHERE Id = @Counter
    
   PRINT CONVERT(VARCHAR,@Counter) + '. country name is ' + @CountryName  
   SET @Counter  = @Counter  + 1        
END
/*
1. country name is Germany
2. country name is France
3. country name is Italy
4. country name is Netherlands
5. country name is Poland
*/



