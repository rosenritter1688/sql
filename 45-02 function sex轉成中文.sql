drop function addSex2

create function dbo.addSex2(@xsex nchar(2))
RETURNS nchar(2)
AS
begin
  select @xsex=sex
  from student 
  where sex = Trim(@xsex);
  if (Trim(@xsex) = 'M')
     select @xsex = '男'
  else
     select @xsex = '女'
  return @xsex;
end;
/*
select * from student2
    std_id     std_name  sex   dep_id     religion   club_id
---------- ----------   ---- ---------- ---------- ----------
1	Z8904025	陳慧穎	  F	    CL  	    R001	   NONE
2	Z9903014	吳汎兒	  F  	CL	        R001	   C001
*/
select std_id,
       std_name,
	   dbo.addSex2(sex),
	   dep_id,
	   religion,club_id
from student2

std_id     std_name        dep_id     religion   club_id
---------- ---------- ---- ---------- ---------- ----------
Z8904025   陳慧穎        女    CL         R001       NONE      
Z9903014   吳汎兒        女    CL         R001       C001      
Z9903031   施雪茂        男    CL         R002       C005      
Z9903103   陳惟珮        男    CL         R002       C002 