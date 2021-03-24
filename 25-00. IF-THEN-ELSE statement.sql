--Syntax:

CASE Expression
   WHEN Con_1 THEN Output1 
   WHEN Con_2 THEN Output2
   WHEN Con_3 THEN Output3
   WHEN Con_4 THEN Output4
   ...
   WHEN Con_n THEN Outputn
   ELSE output
END

Paramaters:
---1. Expression: 
--?   The value to be compared to the list of conditions(Optional).
---2. Con_1, Con_2, …Con_n: 
--?   The conditions are required and are evaluated in the order they are listed. Once a condition is true, the CASE function will return the result and not evaluate the conditions any further.
---3. Output1, Output2, …Outputn: 
--?   The output to be printed once the condition evaluates true.


--example

DECLARE @Name varchar(50)