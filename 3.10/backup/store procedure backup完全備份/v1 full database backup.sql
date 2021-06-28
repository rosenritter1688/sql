CREATE PROCEDURE [dbo].[BackFullStudent]
AS
BEGIN
--USE [student]-->cant leave this USE command in T-SQL
--GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
--GO

DECLARE @path VARCHAR(256) -- path of backup files
SET @path = 'C:\Program Files\Microsoft SQL Server\MSSQL15.STUDYSQL\MSSQL\Backup\'
--print @path
--C:\Program Files\Microsoft SQL Server\MSSQL15.STUDYSQL\MSSQL\Backup\


--@name VARCHAR(MAX) = 'student' -- DB NAME TO CREATE BACKUP
/*method from website*/
declare @name VARCHAR(MAX)
set @name  = 'student'
--print @name

DECLARE @fileDate VARCHAR(20) -- used for file name
SELECT @fileDate = CONVERT(VARCHAR(20),GETDATE(),112)
--result 20210407
DECLARE @fileName VARCHAR(256) -- filename for backup
SET @fileName = @path + @name + '_' + @fileDate + '.BAK'
-- specify filename format

DECLARE @saveName VARCHAR(256)
set @saveName = '完整資料庫備份' + CONVERT(VARCHAR(20),GETDATE(),112) + CONVERT(VARCHAR(20),datepart(hour ,getdate ())) + + CONVERT(VARCHAR(20),datepart(minute ,getdate ())) 
--print @saveName
--完整資料庫備份202104071115


BACKUP DATABASE @name TO DISK = @fileName WITH NOFORMAT, NOINIT,  NAME = @saveName, SKIP, NOREWIND, NOUNLOAD,  STATS = 10

END

--EXEC [BackFullStudent]