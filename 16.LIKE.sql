SQL | LIKE
Difficulty Level : Basic

Sometimes we may require tuples from the database which match certain patterns. For example, we may wish to retrieve all columns where the tuples start with the letter ‘y’, or start with ‘b’ and end with ‘l’, or even more complicated and restrictive string patterns. This is where the LIKE Clause comes to rescue, often coupled with the WHERE Clause in SQL.

There are two kinds of wildcards used to filter out the results:

% : Used to match zero or more characters. (Variable Length)
_ : Used to match exactly one character. (Fixed Length)


Pattern	Meaning
‘a%’	Match strings which start with ‘a’
‘%a’	Match strings with end with ‘a’
‘a%t’	Match strings which contain the start with ‘a’ and end with ‘t’.
‘%wow%’	Match strings which contain the substring ‘wow’ in them at any position.
‘_wow%’	Match strings which contain the substring ‘wow’ in them at the second position.
‘_a%’	Match strings which contain ‘a’ at the second position.
‘a_ _%’	Match strings which start with ‘a’ and contain at least 2 more characters.



--example

Supplier Table:

SupplierID	Name	            Address
S1      	Paragon Suppliers	21-3, Okhla, Delhi
S2      	Mango Nation	    21, Faridabad, Haryana
S3      	Canadian Biz    	6/7, Okhla Phase II, Delhi
S4      	Caravan Traders 	2-A, Pitampura, Delhi
S5      	Harish and Sons	    Gurgaon, NCR
S6      	Om Suppliers	    2/1, Faridabad, Haryana

SELECT SupplierID, Name, Address
FROM Suppliers
WHERE Name LIKE 'Ca%';

--output 

S3	Canadian Biz	6/7, Okhla Phase II, Delhi
S4	Caravan Traders	2-A, Pitampura, Delhi

--example 2
SELECT *
FROM Suppliers
WHERE Address LIKE '%Okhla%';

--Output:

S1	Paragon Suppliers	21-3, Okhla, Delhi
S3	Canadian Biz    	6/7, Okhla Phase II, Delhi

--example3

SELECT SupplierID, Name, Address
FROM Suppliers
WHERE Name LIKE '_ango%';
--Output:

S2	Mango Nation	21, Faridabad, Haryana