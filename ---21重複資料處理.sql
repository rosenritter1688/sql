
--! havent pracrtice
-- USE DISTINCT
--? 用DISTINCT弄出沒有重複的資料出來，並dep_id開頭加上S，
INSERT into department(dep_id,dep_name)
SELECT DISTINCT 'S' + dep_id,depname
FROM department
--?TABLE裡面有一份資料但是兩個重複的另一個是有+S的，所以把沒有+S的全部刪掉
DELETE from department
where dep_id not like 'S%'
--?把開頭S刪掉留下剩下的字元
UPDATE department set dep_id = subtring(dep_id,2,5)
--FINAL RESULT
Dep_Id     Dep_Name
---------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ANTH       人類學研究所
CL         中國文學系
CS         資訊工程學系
JMU        音樂學系
LS         生命科學系
PHYS       物理學系