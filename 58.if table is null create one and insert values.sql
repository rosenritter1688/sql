IF OBJECT_ID('tempdb..##temp') IS NULL 
BEGIN
create table ##temp (
	Id INT IDENTITY(1,1) PRIMARY KEY,   --start from 1,following up will add one
	filename char(256)
	) 

    insert into ##temp (filename)       --一定要有不然就只會創造TABLE後部會插入資料
	values('111111')

END

ELSE 

BEGIN
insert into ##temp (filename) 
values('111111');
END







select * from ##temp

drop table ##temp 