The simplest Join is INNER JOIN.

    INNER JOIN: The INNER JOIN keyword selects all rows from both the tables as long as the condition satisfies. This keyword will create the result-set by combining all rows from both the tables where the condition satisfies i.e value of the common field will be same.
    Syntax:

    SELECT table1.column1,table1.column2,table2.column1,....
    FROM table1 
    INNER JOIN table2
    ON table1.matching_column = table2.matching_column;

/*
    table1: First table.
    table2: Second table
    matching_column: Column common to both the tables.
*/
    --!Note: We can also write JOIN instead of INNER JOIN. JOIN is same as INNER JOIN.


select * from student
/*
Std_Id     Std_Name                                                                                                                                                                                                                                                        Sex   Dep_Id     Religion   Club_Id
---------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----- ---------- ---------- ----------
A00000     林黛玉                                                                                                                                                                                                                                                             0     ANTH       R005       C002      
B1000006   許育瑋                                                                                                                                                                                                                                                             1     ANTH       R002       C001      
B1000007   徐兆瑋                                                                                                                                                                                                                                                             0     ANTH       R002       C004      
B1000008   陳承芬                                                                                                                                                                                                                                                             0     ANTH       R001       C004      
B1000009   李晉穎 
*/

select * from Course

/*
Course_Id  Course_Name                                                                                                                                                                                                                                                     Credit                 Acad_Year              Sem_Id                 Teacher_Id
---------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------- ---------------------- ---------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
099A1300   微生物的妙用                                                                                                                                                                                                                                                          3                      99                     2                      王瑜琦
099A1600   健康疾病與人類發展                                                                                                                                                                                                                                                       4                      99                     2                      吳承寯
099A1700   健康醫學密碼                                                                                                                                                                                                                                                          2                      99                     2                      鄧又寧
099A1800   流行病學與族群健康                                                                                                                                                                                                                                                       3                      99                     2                      謝宗仁
099A1910   看不見的敵人:細菌                                                                                                                                                                                                                                                       2                      99                     2                      王莉萩
099A1920   看不見的敵人:病毒                                                                                                                                                                                                                                                       2                      99                     2                      王莉萩
099A2000   疼痛面面觀       
*/

select * from record

/*
Course_Id  Std_Id     Rcd
---------- ---------- ----------------------
099A1300   B1000008   71
099A1300   B1000022   57.5
099A1300   B1000034   65
099A1300   B1000036   60.5
099A1300   B1000048   62
099A1300   Z7612730   62 
*/


/*
SELECT StudentCourse.COURSE_ID, Student.NAME, Student.AGE FROM Student
INNER JOIN StudentCourse
ON Student.ROLL_NO = StudentCourse.ROLL_NO;
*/


--! 兩顆球中間有交叉重複
--! 此例子是只有顯示重複的部分
--! table A (中間重複) table b


SELECT Record.Rcd,student.Std_Id,student.Std_Name
FROM student
INNER JOIN Record
ON student.std_id = Record.std_id

--as same as below

SELECT r.Rcd,s.Std_Id,s.Std_Name
FROM student as s
INNER JOIN Record as r
ON s.std_id = r.std_id