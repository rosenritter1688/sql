-- Bigquery format
-- https://cloud.google.com/bigquery/docs/reference/standard-sql/string_functions#supported_format_specifiers


--FLOAT
--FORMAT有四捨五入 
SELECT 
      -- method 1        -2 decimal place
      FORMAT("%.*f",2,10000.126) AS flaot_2decimal,  
      -- 10000.13
      
      -- method 2   2 decimal place
      FORMAT("%.2f", 10000.126) AS new_num, 
      -- 10000.13

      -- currency format             
      FORMAT("%'.2f", 10000.126) AS new_num2,           
      -- 10,000.13
      
      --ADDING $ TO INT  
SELECT
      CONCAT(
            "$",
            FORMAT("%'.2f", 10000.126) 
      )AS new_num2
      --$10,000.13
SELECT
      FORMAT("%'d", CAST( 10000.6 AS INT64 ))
        --10,001



--INT

SELECT
      --
      FORMAT("%d",10000) AS int_column,
      --> 10000

      --add leading zeros and set as 10 digits
      FORMAT("%010d",10000) AS int_leading_zero,
      --> 0000010000

      --currency format
      FORMAT("%'d",100000) AS currency_format,
      --> 100,000

      --change float to int then currency format
      --有四捨五入

      FORMAT("%'d",CAST(100000.60 AS INT64)),
      --> 100,001

      --ADDING $ TO INT
      CONCAT(
            "$",
            FORMAT("%'d",CAST(100000.60 AS INT64))
      )
      --> $100,001	

      SELECT
      -- ANOTHER METHOD FOR SETTING 7 DIGITS WITH LEADING ZEROS
      FORMAT("%0*d",7,10000) AS int_column
      --> 0010000



