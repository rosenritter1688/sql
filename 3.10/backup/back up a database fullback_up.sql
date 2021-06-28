--sample from sql server 2019

USE [master]
BACKUP LOG [student] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.STUDYSQL\MSSQL\Backup\student_LogBackup_2021-04-07_10-00-34.bak' WITH NOFORMAT, NOINIT,  NAME = N'student_LogBackup_2021-04-07_10-00-34', NOSKIP, NOREWIND, NOUNLOAD,  NORECOVERY ,  STATS = 5
RESTORE DATABASE [student] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.STUDYSQL\MSSQL\Backup\student_LogBackup_2021-03-31_21-02-27.bak' WITH  FILE = 7,  NOUNLOAD,  STATS = 5

GO

--sample1 from internet.
-- https://blog.e-zest.com/backup-and-restore-database-using-sql-stored-procedure
USE [master]
GO
/****** Object: StoredProcedure [dbo].[DBbackup] Script Date: 11/03/2017 7:35:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Pranita Pendharkar>
-- Create date: <11-03-2017>
-- Description: <To create database backups >
-- =============================================
/*
EXEC [DBbackup] 'DBbackup'
*/
Alter PROCEDURE DBbackup

@name VARCHAR(MAX) = '' -- DB NAME TO CREATE BACKUP
AS
BEGIN

DECLARE @path VARCHAR(256)     -- path of backup files
DECLARE @fileName VARCHAR(256) -- filename for backup
DECLARE @fileDate VARCHAR(20)  -- used for file name

SET @path = 'E:\Data\FTP\Backup\'

-- specify filename format
SELECT @fileDate = CONVERT(VARCHAR(20),GETDATE(),112)

BEGIN
SET @fileName = @path + @name + '_' + @fileDate + '.BAK'
BACKUP DATABASE @name TO DISK = @fileName
END
END
GO

--Likewise just pass names of db’s to stored procedure to create backup.
EXEC [DBbackup] 'Database1'
EXEC [DBbackup] 'Database2'