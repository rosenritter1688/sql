-- check all from table student
select * from student -- select all from table student
GO --execute all the sql query as above

select * from Record

Course_Id  Std_Id     Rcd
---------- ---------- ----------------------
099A1300   B1000008   71
099A1300   B1000022   57.5
099A1300   B1000034   65
099A1300   B1000036   60.5
099A1300   B1000048   62
099A1300   Z7612730   62
099A1300   Z7671191   66
099A1300   Z8904025   88

select Std_Id,Rcd
From Record;

-- Result
Std_Id     Rcd
---------- ----------------------
B1000008   71
B1000022   57.5
B1000034   65
B1000036   60.5
B1000048   62