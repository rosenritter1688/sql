



-- bigquery getting columns schema
SELECT * 
EXCEPT(table_catalog) 
FROM `data-sci-acad-learn-sql`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name='daily_amount'-- AND table_schema='test';


-- mysql
DESCRIBE table_name;


-- get full detail of a table
describe component;
