
"While loop: In SQL SERVER, while loop can be used in similar manner as any other programming language. 
A while loop will check the condition first and then execute the block of SQL Statements within it as long as the condition evaluates true.
"
--Syntax:

WHILE condition
BEGIN
   {...statements...}
END;

--Parameters:
"
1. Condition: The condition is tested in each pass through the loop. If condition evaluates to TRUE, the loop body is executed otherwise the loop is terminated.
2. Statements: The statements that needs to be executed in each pass through the loop."

--example
DECLARE @counter INT -- declaring variable
SET @counter = 0     -- assigning value 0 to variable counter  
WHILE @counter <= 10
BEGIN
   PRINT 'Inside WHILE loop on GreeksForGreeks'
   PRINT @counter
   SET @counter = @counter + 1
END;

PRINT 'DONE WHILE LOOP on GreeksForGreeks'
GO


--OUTPUT
Inside WHILE loop on GreeksForGreeks
0
Inside WHILE loop on GreeksForGreeks
1
Inside WHILE loop on GreeksForGreeks
2
Inside WHILE loop on GreeksForGreeks
3
Inside WHILE loop on GreeksForGreeks
4
Inside WHILE loop on GreeksForGreeks
5
Inside WHILE loop on GreeksForGreeks
6
Inside WHILE loop on GreeksForGreeks
7
Inside WHILE loop on GreeksForGreeks
8
Inside WHILE loop on GreeksForGreeks
9
Inside WHILE loop on GreeksForGreeks
10
DONE WHILE LOOP on GreeksForGreeks

完成時間: 2021-03-07T00:26:49.5785463+09:00


--example2

