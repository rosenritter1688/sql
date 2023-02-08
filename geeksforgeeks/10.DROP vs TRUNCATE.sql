DROP vs TRUNCATE

1. Truncate is normally ultra-fast and its ideal for deleting data from a temporary table.
2. Truncate preserves the structure of the table for future use, unlike drop table 
   where the table is deleted with its full structure.
3. Table or Database deletion using DROP statement cannot be rolled back, 
   so it must be used wisely.