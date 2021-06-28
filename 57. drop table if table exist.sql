--method 1
--if ##temp table is exist
IF OBJECT_ID('tempdb..##temp') IS NOT NULL 
   DROP TABLE ##temp

--method 2
--drop if ##temp table is exist
DROP TABLE IF EXISTS tempdb.dbo.##temp
DROP TABLE ##temp

--!差別 方法1如果沒有此##temp table不會有錯誤編號
--!     方法2如果沒有此##temp table會有錯誤編號!!!

