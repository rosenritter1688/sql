
SQL | GROUP BY
Difficulty Level : Easy
                                               line 18   
The GROUP BY Statement in SQL is used to arrange identical data into groups with the help of some functions. 
i.e if a particular column has same values in different rows then it will arrange these rows in a group.
GROUP BY 在SQL是用來讓完全一樣的資料分成不同的組別 ie如果再column裡面有一些一樣的資料但是在不同的row就會被分成為一組

--! Important Points:

--! >GROUP BY clause is used with the SELECT statement.
    --        line 31    
--! >　In the query, GROUP BY clause is placed after the WHERE clause.
--! >　In the query, GROUP BY clause is placed before ORDER BY clause if used any.



identical adjective
UK  /aɪˈden.tɪ.kəl/ US  /aɪˈden.t̬ə.kəl/
 
exactly the same, or very similar
完全相同的；極為相似的
I have got three identical blue suits.
我有三套完全相同的藍色西裝。
The two rooms were virtually identical.
這兩個房間幾乎一模一樣。




clause noun [C] (GRAMMAR)
 
B2 LANGUAGE   specialized
a group of words, consisting of a subject and a finite form of a verb
子句


文法重點
1. 
WHERE
GROUP BY

2.
GROUP BY
ORDER BY

example
-- 算出學生的平均成績
select std_id, count(*),SUM(rcd),AVG(rcd) -- count(*)計算有出現幾次
from Record r
GROUP BY std_id                           -- 把一樣的std_id弄在同一組

'
i did check the result as shown below are correct!!!
'



std_id                                        
---------- ----------- ---------------------- ----------------------
B1000001   5           318                    63.6
B1000002   5           350                    70
B1000003   7           481                    68.7142857142857
B1000004   4           250                    62.5
B1000005   8           542                    67.75
B1000006   4           260                    65
B1000007   6           443                    73.8333333333333
B1000008   4           316                    79
B1000009   7           580                    82.8571428571429
B1000010   6           458                    76.3333333333333
以下省略.....

'
GROUP BY可以用多個column
ie
GROUP BY std_id,Course_Id   
'
