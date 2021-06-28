--To Restore Database backups
--USE [master]
--GO
/****** Object: StoredProcedure [dbo].[DBRestore] Script Date: 11/03/2017 7:23:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Pranita Pendharkar>
-- Create date: <11-03-2017>
-- Description: <To Restore backup >
-- =============================================
/*
EXEC [DBRestore] 'DBRestore'
*/
CREATE PROCEDURE DBRestore

@name VARCHAR(MAX) = '' -- DB NAME TO Restore
AS
BEGIN

DECLARE @SQL VARCHAR(MAX)
DECLARE @NewDBName VARCHAR(MAX) -- NEW DB NAME TO RESTORE THE BACKED UP DB.
DECLARE @FileNameOrgBackup VARCHAR(MAX) -- Backup file name to restore
DECLARE @PathOrgignalBackup VARCHAR(MAX) -- Path of backup file to restore

SET @NewDBName = @name
SET @PathOrgignalBackup = 'E:\Data\FTP\'
SET @FileNameOrgBackup = @PathOrgignalBackup + @name + '.bak'
SET @SQL = ''

SET @SQL ='RESTORE DATABASE ' + @NewDBName
SET @SQL = @SQL + ' FROM DISK = ''' + @FileNameOrgBackup + ''''

EXECUTE(@SQL)
END
GO

Likewise just pass names of db’s to stored procedure to restore database.
EXEC [DBRestore] 'Database1'
EXEC [DBRestore] 'Database2'

This is a very straight forward process to backup and restore which will reduce our repetitive work.
Hope this will help you!!!!!!!
Similar Blog