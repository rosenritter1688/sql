The simplest Join is INNER JOIN.

    INNER JOIN: The INNER JOIN keyword selects all rows from both the tables as long as the condition satisfies. 
    This keyword will create the result-set by combining all rows from both the tables where the condition satisfies 
    i.e value of the common field will be same.
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
*/
select * from Course
/*
Course_Id  Course_Name                                                                                                                                                                                                                                                     Credit                 Acad_Year              Sem_Id                 Teacher_Id
---------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------- ---------------------- ---------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
099A1300   微生物的妙用                                                                                                                                                                                                                                                          3                      99                     2                      王瑜琦
*/
select * from record
/*
Course_Id  Std_Id     Rcd
---------- ---------- ----------------------
099A1300   B1000036   60.5
*/


/*
SELECT StudentCourse.COURSE_ID, Student.NAME, Student.AGE 
FROM Student
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