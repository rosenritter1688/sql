/* INSERT */
-- 單筆
insert into course (course_id, course_name)
values('C001','資料探');
--multiple values

--method 1
insert into course (course_id,course_name)
values('C001','資料探'),('C002','資料探2'),('C003','資料探3');


insert into club_try (Club_Id,Club_Name)
values('C001','登山社'),('C002','辯論社'),('C003','熱舞社'),('C004','電競社'),('C005','慈幼社');

--method 2  <DONT KNOW>
insert into course(course_id,course_name)
select * from courseTemp
Where course_name like %資料%;

--method 3  <DONT KNOW>

insert into course(course_id,course_name)
select course_id, course_name from courseTemp
WHERE course_name like %資料%;