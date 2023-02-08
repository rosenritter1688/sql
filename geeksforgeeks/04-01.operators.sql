operator	description
>	--Greater Than
>=	--Greater than or Equal to
<	--Less Than
<=	--Less than or Equal to
=	--Equal to --!python is ==
<>	--Not Equal to --!python is !=
BETWEEN	--In an inclusive Range
--basic syntax
/*

SELECT COLUMN_1,COLUMN_2
FROM table_name
WHERE COLUMN_name BETWEEN value_1 AND value_2;

*/

LIKE	--Search for a pattern
IN	--To specify multiple possible values for a column


--? sample table
/*
ROLL_NO NAME       ADDRESS    PHONE      AGE
------- ---------- ---------- ---------- ----
1       Ram        delhi      XXXXXXX    18
2       Ramesh     gurgaon    XXXXXXX    17
3       sujit      rohtak     XXXXXXX    20
4       suresh     delhi      XXXXXXX    16

*/

--? sample code
=	--Equal to --!python is ==

SELECT *
FROM student
WHERE aga=20;

<>	--Not Equal to --!python is !=

SELECT *
FROM student
WHERE age<>20;
