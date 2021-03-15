WHERE clause is used to place conditions on columns

-- check those who failed
-- table & column 大小寫沒關係!!!
select course_Id,std_Id,rcd
From record
Where rcd >59;

course_Id  std_Id     rcd
---------- ---------- ----------------------
099A1300   B1000008   71
099A1300   B1000034   65
099A1300   B1000036   60.5
099A1300   B1000048   62
099A1300   Z7612730   62
099A1300   Z7671191   66
099A1300   Z8904025   88
099A1300   Z9903014   84
099A1300   Z9903031   62.5
099A1300   Z9903138   77
099A1600   B1000021   66
099A1600   B1000035   95
099A1600   Z6630165   66
099A1600   Z7612411   65