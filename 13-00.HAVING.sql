HAVING Clause
在group裡面設定conditions

We know that WHERE clause is used to place conditions on columns but 
what if we want to place conditions on groups?
This is where HAVING clause comes into use. 
We can use HAVING clause to place conditions to decide which group will be the part of final result-set. 
Also we can not use the aggregate functions like SUM(), COUNT() etc. with WHERE clause. 
So we have to use HAVING clause if we want to use any of these functions in the conditions.

aggregate
adjective [ before noun ]
UK  /ˈæɡ.rɪ.ɡət/ US  /ˈæɡ.rə.ɡət/
 
total
合計的，總的；總數的
The seven companies have an aggregate turnover of £5.2 million.
這七家公司的總營業額為520萬英鎊。

aggregate noun [C or U] (TOTAL)
 
something formed by adding together several amounts or things
聚集體，集成體；總數，合計
They purchased an aggregate of 3,000 shares in the company.
他們總共買了這家公司的3000股股票。

aggregate
verb [ T ]
UK  /ˈæɡ.rɪ.ɡeɪt/ US  /ˈæɡ.rə.ɡeɪt/
 
to combine into a single group or total
使聚集，使積聚




-------------------------------------------
syntax 
------------------------------------------
syntax
noun [ U ]   LANGUAGE   specialized
UK  /ˈsɪn.tæks/ US  /ˈsɪn.tæks/
 
the grammatical arrangement of words in a sentence
句法；句子結構

SELECT column1, function_name(column2)
FROM table_name
WHERE condition
GROUP BY column1, column2
HAVING condition
ORDER BY column1, column2;

function_name: Name of the function used for example, SUM() , AVG().
table_name: Name of the table.
condition: Condition used.

-------------
example
-------------

SELECT NAME, SUM(SALARY) FROM Employee 
GROUP BY NAME
HAVING SUM(SALARY)>3000;  --only group those total salary have more than 3000



--------
example 2
--------

example
-- 算出學生的平均成績
select std_id, count(*),SUM(rcd),AVG(rcd) -- count(*)計算有出現幾次
from Record r
GROUP BY std_id                           -- 把一樣的std_id弄在同一組
HAVING AVG(rcd) > 80   --only show those whom have more than avg 80 marks


std_id                                        
---------- ----------- ---------------------- ----------------------
B1000009   7           580                    82.8571428571429
B1000014   11          881.5                  80.1363636363636
B1000035   3           270                    90
B1000043   4           357                    89.25
B1000044   2           175                    87.5
B1000047   6           483                    80.5
Z7610168   3           290                    96.6666666666667
Z7612411   4           339                    84.75
Z7615411   6           515                    85.8333333333333
Z8613373   3           253                    84.3333333333333
Z8651127   3           278                    92.6666666666667
Z9612095   13          1050                   80.7692307692308