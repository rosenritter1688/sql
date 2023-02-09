--! Inserting specific columns of a table: 
--! We can copy only those columns of a table which we want 
--! to insert into in a different table.
--syntax
INSERT INTO first_table(names_of_columns1) 
SELECT names_of_columns2 
FROM second_table;

--sample code
--! for insert all rows
INSERT INTO student
select * 
FROM  LateralStudent