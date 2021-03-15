'
The SUBSTRING() function extracts a substring starting from a position in an input string with a given length. 
In the case of substring, you need an input string and need to mention the starting point and the total length of the string.

Input  : String, start, length
output : substring.
'
--Syntax :

SUBSTRING(input_string, start, length);

--example
SELECT SUBSTRING('SQL In Geeksforgeeks', 7, 18 ) 
AS ExtractString;