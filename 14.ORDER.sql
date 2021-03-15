SQL | ORDER BY
https://www.geeksforgeeks.org/sql-order-by/

The ORDER BY statement in sql is used to sort the fetched data in either ascending or descending according 
to one or more columns.
> By default ORDER BY sorts the data in ascending order.

Sort according to one column: 
Syntax:
SELECT * FROM table_name ORDER BY column_name ASC|DESC

Sort according to multiple columns: 
Syntax:
SELECT * FROM table_name ORDER BY column1 ASC|DESC , column2 ASC|DESC



--------
example
--------                                     >> 設定為t變數
select std_id, count(*),SUM(rcd),AVG(rcd) as t  -- count(*)計算有出現幾次
from Record r
GROUP BY std_id                                 -- 把一樣的std_id弄在同一組
HAVING AVG(rcd) > 80                            --only show those whom have more than avg 80 marks
Order by t                           --      >> t 小到大
           -- 只有ASC才可以不用寫 DESC要寫

std_id                                        t
---------- ----------- ---------------------- ----------------------
B1000014   11          881.5                  80.1363636363636
B1000047   6           483                    80.5
Z9612095   13          1050                   80.7692307692308
B1000009   7           580                    82.8571428571429
Z8613373   3           253                    84.3333333333333
Z7612411   4           339                    84.75
Z7615411   6           515                    85.8333333333333
B1000044   2           175                    87.5
B1000043   4           357                    89.25
B1000035   3           270                    90
Z8651127   3           278                    92.6666666666667
Z7610168   3           290                    96.6666666666667


------
example
------ 平均分數大到小 , std_id 次數 小排到大
                                                    --> NAMING AVG(rcd) as t
select std_id, count(*) as counting,SUM(rcd),AVG(rcd) as t -- count(*)計算有出現幾次
from Record r
GROUP BY std_id                           -- 把一樣的std_id弄在同一組
HAVING AVG(rcd) > 80   --only show those whom have more than avg 80 marks
Order by t DESC,counting 

std_id     counting                           t
---------- ----------- ---------------------- ----------------------
Z7610168   3           290                    96.6666666666667
Z8651127   3           278                    92.6666666666667
B1000035   3           270                    90
B1000043   4           357                    89.25
B1000044   2           175                    87.5
Z7615411   6           515                    85.8333333333333
Z7612411   4           339                    84.75
Z8613373   3           253                    84.3333333333333
B1000009   7           580                    82.8571428571429
Z9612095   13          1050                   80.7692307692308
B1000047   6           483                    80.5
B1000014   11          881.5                  80.1363636363636

>>網站教學例子
SELECT * FROM Student ORDER BY Age ASC , ROLL_NO DESC;
Output:

ROLL_NO	        NAME	    ADDRESS	    PHONE	    Age
7	            ROHIT	    BALURGHAT	XXXXXXXXXX	18
4	            DEEP	    RAMNAGAR	XXXXXXXXXX	18
1	            HARSH	    DELHI	    XXXXXXXXXX	18
8	            NIRAJ	    ALIPUR  	XXXXXXXXXX	19
5	            SAPTARHI	KOLKATA 	XXXXXXXXXX	19
2	            PRATIK	    BIHAR	    XXXXXXXXXX	19
6	            DHANRAJ	    BARABAJAR	XXXXXXXXXX	20
3	            RIYANKA	    SILIGURI	XXXXXXXXXX	20