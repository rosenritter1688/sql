
## for MYSQL

#! 
-- CONCAT IS FOR JOINING STRINGS 
-- BIGQUERY AND MYSQL WORKS

--  || CAN BE USE ON BIGQUERY BUT NOT MYSQL


SELECT 
    avetemp_kbn,
    count(table_s.avetemp_kbn) AS counting
FROM (
    SELECT
        CONCAT (
            FLOOR ( avetemp / 5 ) * 5 ,
            '-' ,
            ((FLOOR ( avetemp / 5 ) + 1) * 5)
        ) AS avetemp_kbn
    FROM
        `data-sci-acad-learn-sql`.TW14_N10.daily_amount
) AS table_s
group by
    table_s.avetemp_kbn


-- RESULT   
-- NO LEADING ZEROS

10-15	57
15-20	57
20-25	76
25-30	65
30-35	1
5-10	91
0-5	    18



-- select 
--     FORMAT('|%10d|', 11)


select
    format("%02d",CAST((FLOOR ( avetemp / 5 ) * 5 )AS int64 ) )
from
    `data-sci-acad-learn-sql`.TW14_N10.daily_amount


-- TEACHER'S SAMPLE CODE

-- FORMAT IS FOR LEADING ZEROS
-- MYSQL IS LPAD(4, 2, 0)    (VALUE,NO_OF_DIGITS,FILL_UP_BY_WHAT)
-- FORMAT('%02', 4)   >>   04   
--  * format() in mysql is for decimail place
-- in mysql
-- format(10 , 2)  >> result 10.00
select
FORMAT('%03d', 10);


-- FLOOR ()
-- 無條件捨去

-- cast()
-- convert data type


select   -- ５で区分していきます
    format("%02d",CAST(floor(avetemp / 5) * 5 AS INT64 )) 
    || "-" || 
    format("%02d",CAST((floor(avetemp / 5) + 1 ) * 5 AS INT64))
    AS avetemp_kbn,
from
    `data-sci-acad-learn-sql`.TW14_N10.daily_amount
order by avetemp_kbn;


--- my way of doing



SELECT 
    avetemp_kbn,
    count(table_s.avetemp_kbn) AS counting
FROM (
    SELECT
        -- adding three strings together
        CONCAT 
        ( 
            -- ADD LEADING ZEROs FOR 1 DIGIT EXP. 0 > 00, 5 > 05
            LPAD
            (
              -- CONVERTING TO STRING
              CAST((FLOOR ( avetemp / 5 ) * 5 ) AS STRING),
              2,
              "0"
            ),
            '-' ,
            LPAD
            (
              CAST( ( (FLOOR ( avetemp / 5 ) + 1) * 5) AS STRING),
              2,
              '0'
            )
        ) AS avetemp_kbn
    FROM
        `data-sci-acad-learn-sql`.TW14_N10.daily_amount
) AS table_s
group by
    table_s.avetemp_kbn

--  reason for using LPAD adding leading ZERO
--  however,   LAPD onlys works for string only in bigquery

--  select 
--    LPAD( 10, 3, 0);
--! will raise error
--! No matching signature for function LPAD for argument types: INT64, INT64, INT64. 
--! Supported signatures: LPAD(STRING, INT64, [STRING]); 
--! works for bytes too but just ignore that for now
--! LPAD(BYTES, INT64, [BYTES]) at [3:5]