
--step 1 create temp                --!the table 'student' itself is using collation Chinese_Taiwan_Stroke_CI_AS, but the temp table will be use server collation default and which is not USING Chinese_Taiwan_Stroke_CI_AS
create table #temp4 (               --!設定 collation to Chinese_Taiwan_Stroke_CI_AS coz temp's collation is base on server collation by default      
					std_id char(10) COLLATE Chinese_Taiwan_Stroke_CI_AS , 
					credits int)

--step2 <double checlking temp
select * from #temp4

--step 3 <get data from 2 tables and insert it to temp
insert into #temp3 (std_id, credits)
SELECT r.std_id, sum(c.credit)
from record r, course c
WHERE r.course_id = c.course_id
GROUP BY r.std_id

--setp 4 double checking temp
select * from #temp2  -- double checlking

--setp 5 update temp data to student table
UPDATE student set credits = t.credits
from student s, #temp3 t
where s.std_id = t.std_id

select * from student


--可以使用'設計'來把column資料全部刪除掉
-- table mouse right click and select '設計' 
