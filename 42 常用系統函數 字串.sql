--! not done yet substring, right, left

--? EX. Ltrim, rtrim, trim, left, right, substring
declare @str varchar(10)
set @str = '    12345 '; -->注意左右邊有space
--!左邊削掉空白
select '[' + ltrim(@str) + ']'
--[12345 ]

select '右邊空白削掉[' + rtrim(@str) + ']'
--右邊空白削掉[    12345]

select ' 左右邊空白削掉[' + trim(@str) + ']'
-- 左右邊空白削掉[12345]

select '[' + SUBSTRING(@str, 1,5)+ ']'
/*
SUBSTRING(@str, 1,5)+ ']', '[' +
left(@str,5) + ']', '[' + right(@str, 5) + ']';

*/


