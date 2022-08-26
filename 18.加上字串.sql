--table



Std_Id     Std_Name                       Sex   Dep_Id     Religion   Club_Id
---------- ------------------------------ ----- ---------- ---------- ----------
A00000     林黛玉                            0     ANTH       R005       C002      
B1000006   許育瑋                            1     ANTH       R002       C001      
B1000007   徐兆瑋                            0     ANTH       R002       C004      
B1000008   陳承芬                            0     ANTH       R001       C004      
B1000009   李晉穎                            1     ANTH       R002       C002      
B1000010   余慧勳                            0     ANTH       R004       C001      
B1000011   寇汎兒                            1     ANTH       R003       C004      
B1000012   吳世珮                            0     LS         R005       C001      
B1000013   施雪群                            0     LS         R004       C002      
B1000014   陳家修                            1     LS         R005       C005      
B1000015   陳偉恆                            0     LS         R004       C005      
B1000016   許育叡                            0     LS         R004       C003      
B1000017   徐智齊                            1     LS         R002       C001      
B1000018   陳杰德                            1     LS         R002       C003      
B1000019   邱怡軒                            0     LS         R004       C001      
B1000020   吳彥先                            0     LS         R002       C003      
B1000021   曾宏文                            0     LS         R001       NONE      
B1000022   李曜儀                            0     LS         R001       NONE      
B1000023   王凱宇                            1     LS         R004       NONE     
and more
--

--sample
'字串加在前面Std_id'
SELECT 'A' + Std_id,std_name 
FROM Student;

            std_name
----------- ------------------------------
AA00000     林黛玉
AB1000006   許育瑋
AB1000007   徐兆瑋
AB1000008   陳承芬
AB1000009   李晉穎
AB1000010   余慧勳
AB1000011   寇汎兒
AB1000012   吳世珮

--sample 2
SELECT Std_id + 'A',std_name
FROM Student;

            std_name
----------- ------------------------------
A00000    A 林黛玉
B1000006  A 許育瑋
B1000007  A 徐兆瑋
B1000008  A 陳承芬
B1000009  A 李晉穎
B1000010  A 余慧勳
B1000011  A 寇汎兒
B1000012  A 吳世珮

--sample with DISTICT

SELECT distinct 'A' + Std_id,std_name
FROM Student;
--用 Distinct 取出原有的唯一資料, 並以 dep_id'A'創出新的資料創
            std_name
----------- ------------------------------
AA00000     林黛玉
AB1000006   許育瑋
AB1000007   徐兆瑋
AB1000008   陳承芬
AB1000009   李晉穎


