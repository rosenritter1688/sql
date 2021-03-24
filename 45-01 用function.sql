--資料表內的資料值為 0/1, 寫 toSex 轉為女 男 ; 如執行下列指令
select std_id, dbo.toSex(sex) from student
               -->use function toSex

--例table record( std_id , course_id , rcd );
--執行下列指令 學生如為女性 學號旁會出現 女 ), 成績若不及格 , 成績旁會出現 Fail:
select showSex(std_id), course_id , showFail(rcd)
       -->use function showSex      -->use function showFail
from record;