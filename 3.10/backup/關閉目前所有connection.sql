---RECOVER from log
----有關閉目前所有connection 有兩行 前跟尾巴 line 5 and line 12

USE [master]
ALTER DATABASE [student] SET SINGLE_USER WITH ROLLBACK IMMEDIATE --
BACKUP LOG [student] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.STUDYSQL\MSSQL\Backup\student_LogBackup_2021-04-07_09-24-15.bak' WITH NOFORMAT, NOINIT,  NAME = N'student_LogBackup_2021-04-07_09-24-15', NOSKIP, NOREWIND, NOUNLOAD,  NORECOVERY ,  STATS = 5
RESTORE DATABASE [student] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.STUDYSQL\MSSQL\Backup\student_LogBackup_2021-03-31_21-02-27.bak' WITH  FILE = 7,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [student] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.STUDYSQL\MSSQL\Backup\student_LogBackup_2021-03-31_21-02-27.bak' WITH  FILE = 8,  NORECOVERY,  NOUNLOAD,  STATS = 5  --log 1
RESTORE LOG [student] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.STUDYSQL\MSSQL\Backup\student_LogBackup_2021-03-31_21-02-27.bak' WITH  FILE = 9,  NORECOVERY,  NOUNLOAD,  STATS = 5   --log2
RESTORE LOG [student] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.STUDYSQL\MSSQL\Backup\student_LogBackup_2021-03-31_21-02-27.bak' WITH  FILE = 10,  NORECOVERY,  NOUNLOAD,  STATS = 5  --log3
RESTORE LOG [student] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.STUDYSQL\MSSQL\Backup\student_LogBackup_2021-04-07_08-56-55.bak' WITH  FILE = 1,  NOUNLOAD,  STATS = 5  --log4
ALTER DATABASE [student] SET MULTI_USER   --

GO

----RECOVER from log  沒有關閉所有connection


USE [master]
BACKUP LOG [student] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.STUDYSQL\MSSQL\Backup\student_LogBackup_2021-04-07_09-26-29.bak' WITH NOFORMAT, NOINIT,  NAME = N'student_LogBackup_2021-04-07_09-26-29', NOSKIP, NOREWIND, NOUNLOAD,  NORECOVERY ,  STATS = 5
RESTORE DATABASE [student] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.STUDYSQL\MSSQL\Backup\student_LogBackup_2021-03-31_21-02-27.bak' WITH  FILE = 7,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [student] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.STUDYSQL\MSSQL\Backup\student_LogBackup_2021-03-31_21-02-27.bak' WITH  FILE = 8,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [student] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.STUDYSQL\MSSQL\Backup\student_LogBackup_2021-03-31_21-02-27.bak' WITH  FILE = 9,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [student] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.STUDYSQL\MSSQL\Backup\student_LogBackup_2021-03-31_21-02-27.bak' WITH  FILE = 10,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [student] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.STUDYSQL\MSSQL\Backup\student_LogBackup_2021-04-07_08-56-55.bak' WITH  FILE = 1,  NOUNLOAD,  STATS = 5

GO



BACKUP LOG Dbname TO DISK = 'log.bak'