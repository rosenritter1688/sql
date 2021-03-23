create table #temp2(club_id varchar(10) collate Chinese_Taiwan_Stroke_CI_AS, member int)
--! 只有文字才可以指定 int不可以


--
ALTER TABLE dbo.Club 
ALTER COLUMN CharCol VARCHAR(50) COLLATE Chinese_Taiwan_Bopomofo_CI_AS

--! This method is easy to implement, however it's a possibly blocking operation 
--! which may become an issue for large tables and busy applications.


--! 比較好的方法如下

--Copy and replace. Consider one of the existing tables defined below:


-- NVARCHAR column is encoded in UTF-16 because a supplementary character enabled collation is used
CREATE TABLE dbo.MyTable (CharCol NVARCHAR(50) COLLATE Latin1_General_100_CI_AI_SC);
GO

-- VARCHAR column is encoded using the Latin code page and therefore is not Unicode capable
CREATE TABLE dbo.MyTable (CharCol VARCHAR(50) COLLATE Latin1_General_100_CI_AI);
GO

--To convert the column to use UTF-8, copy the data to a new table where the target column is already the required data type and a UTF-8 enabled collation, and then replace the old table:

CREATE TABLE dbo.MyTableNew (CharCol VARCHAR(50) COLLATE Latin1_General_100_CI_AI_SC_UTF8);
GO
INSERT INTO dbo.MyTableNew 
SELECT * FROM dbo.MyTable;
GO
DROP TABLE dbo.MyTable;
GO
EXEC sp_rename 'dbo.MyTableNew', 'dbo.MyTable'; --? 把TABLE名稱 'dbo.MyTableNew' TO 'dbo.MyTable';
GO
This method is much faster than in-place conversion, but handling complex schemas with many dependencies (FKs, PKs, Triggers, DFs) and synching the tail of the table (if the database is in use) requires more planning.