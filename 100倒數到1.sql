Declare @myVar int
set @myVar = 100
while @myVar > 0
BEGIN
print @myVar
set @myVar = @myVar -1
end