'
Break statement: BREAK statement as the name signifies is used to break the flow of control. 
It can be used in SQL in similar manner as any other programming language.
'

--Example: While loop with Break statement

--example
DECLARE @counter INT -- declaring variable
SET @counter = 0;     -- assigning value 0 to variable counter  
WHILE @counter <= 10
BEGIN
   PRINT @counter
   PRINT 'Inside WHILE loop on GreeksForGreeks'
   SET @counter = @counter + 1;
IF @counter = 5
--!better use 
--IF (@counter = 5)
--print @counter--!cant leave it here
BREAK
END;
PRINT @counter  
PRINT 'DONE WHILE LOOP on GreeksForGreeks'
GO
'
Note : In the example, when variables value became five, 
BREAK Statement is executed and the control gets out from the Loop.
'

'
Do-While loop: SQL server does not have the feature of do-while loop but by doing little modifications in while loop, the same behaviour can be achieved.
'

--example
DECLARE @counter INT -- declaring variable
SET @counter = 0; 

WHILE(1 = 1)      --? we have to make condition true when it enters into the loops
BEGIN             --? if we want to use loop as DO..WHILE
   PRINT 'Inside LOOP on GREEKSFORGREEKS';
   SET @counter = @counter + 1;
   PRINT @counter
IF (@counter > 10)
BREAK
END;
PRINT 'Outside LOOP on GREEKSFORGREEKS'
GO