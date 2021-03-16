N operator
/*
It is used to fetch filtered data same as fetched by ‘=’ operator just the difference
 is that here we can specify multiple values for which we can get the result set.
 */

--?Basic Syntax:

--SELECT column1,column2 
--FROM table_name 
--WHERE column_name 
--IN (value1,value2,..);


Supplier Table:
supplier_id Name                 address
----------- -------------------- ------------------------------
S1          Paragon Suppliers    21-3, Okhla, Delhi
S2          Mango Nation         21, Faridabad, Haryana
S3          Canadian Biz         6/7, Okhla Phase II, Delhi
S4          Caravan Traders      2-A, Pitampura, Delhi
S5          Harish and Sons      Gurgaon, NCR
S6          Om Suppliers         2/1, Faridabad, Haryana


select * 
from supplier
where supplier_id
in ('S1','S5')

--RESULt
/*
supplier_id Name                 address
----------- -------------------- ------------------------------
S1          Paragon Suppliers    21-3, Okhla, Delhi
S5          Harish and Sons      Gurgaon, NCR
*/
--! look for NULL must use 
--! WHERE column IS NULL;

SELECT * 
FROM student
WHERE address = 'delhi' 
      AND age = 18 
	  AND phone IS NULL;