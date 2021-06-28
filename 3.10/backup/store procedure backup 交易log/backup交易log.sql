IF OBJECT_ID('tempdb..##temp') IS NULL 
BEGIN
create table ##temp (
	Id INT IDENTITY(1,1) PRIMARY KEY,   --start from 1,following up will add one
	filename char(256)
		) 
	GO
    insert into ##temp (filename) values('111111')
	GO
END
ELSE 
BEGIN
insert into ##temp (filename) values('111111');
END



---------------------
2. 設計stored Procedure RestoreFullStudent
1) 執行結尾記錄備份
2) Restore 上面的完整備份
3) Restore 1)的結尾記錄備份

CREATE PROCEDURE RestoreFullStudent
AS
BEGIN



--1) 執行結尾記錄備份
DECLARE @path VARCHAR(256) -- path of backup files
SET @path = 'C:\Program Files\Microsoft SQL Server\MSSQL15.STUDYSQL\MSSQL\Backup\'

declare @name VARCHAR(MAX)
set @name  = 'student'
--print @name

DECLARE @fileDate VARCHAR(20) -- used for file name
SELECT @fileDate = CONVERT(VARCHAR(20),GETDATE(),112) + CONVERT(VARCHAR(20),datepart(hour ,getdate ())) + + CONVERT(VARCHAR(20),datepart(minute ,getdate ())) 
--result 20210407
DECLARE @fileName VARCHAR(256) -- filename for backup
SET @fileName = @path + @name + '_' + @fileDate + '.BAK'
-- specify filename format

DECLARE @saveName VARCHAR(256)
set @saveName = 'log備份' + CONVERT(VARCHAR(20),GETDATE(),112) + CONVERT(VARCHAR(20),datepart(hour ,getdate ())) + + CONVERT(VARCHAR(20),datepart(minute ,getdate ())) 
--print @saveName
--完整資料庫備份202104071115

BACKUP DATABASE @name TO DISK = @fileName WITH NOFORMAT, NOINIT,  NAME = @saveName, SKIP, NOREWIND, NOUNLOAD,  STATS = 10



END

--sample backup log
BACKUP LOG [student] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.STUDYSQL\MSSQL\Backup\student_20210407.BAK' 
WITH NOFORMAT, NOINIT,  NAME = N'student-完整 資料庫 備份', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO



--------------------------------------------------------------------------------------


