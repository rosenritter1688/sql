--> create a stored procedure  getClubMember(),
CREATE PROCEDURE getClubMember
AS
BEGIN
-->SETP 1  create temp table
create table #temp (
		Club_Id char(4),
		members int,
		Club_Name nchar(10)
		)
-->SETP 2 double check temp table
select * from #temp
-->SETP 3
insert into #temp (Club_Id,members,Club_Name)   ----#把下面步驟的結果抓出來 塞到temp table......
-->SETP 4 算出club總人數，並將多一個欄位稱為CLUB_NAME，把CLUB_ID轉換成可讀再丟到欄位CLUB_NAME
SELECT Club_Id,count(Club_Id) AS members,       ----讓CLUD_ID可以轉換成可讀
		case Club_Id when 'C001' then '登山社'
				     when 'C002' then '辯論社'
					 when 'C003' then '熱舞社'
					 when 'C004' then '電競社'
					 when 'C005' then '慈幼社' 
		ELSE 'NO club'
		END as Club_Name                        -----轉換可讀字串的tuple的欄位命名為Club_Name，
FROM student                                    
GROUP BY Club_Id
-->SETP 5 check result from temp table for double checking
select * from #temp
--result--
/*
Club_Id    members     Club_Name
---------- ----------- ---------
C001       17          登山社
C002       19          辯論社
C003       11          熱舞社
C004       17          電競社
C005       14          慈幼社
NONE       19          NO club
*/
-->SETP 6  使用temp table to update table by adding total club number
UPDATE club_try  
SET members = #temp.members
FROM #temp  
where club_try.Club_Id = #temp.Club_Id
  and club_try.Club_Name = #temp.Club_Name
-->SETP 7 double check table
select * from club_try
/*
Club_Id Club_Name  members
------- ---------- -----------
C001    登山社        17
C002    辯論社        19
C003    熱舞社        11
C004    電競社        17
C005    慈幼社        14


none 沒有加進來
*/
--> 後段create a stored procedure  getClubMember(),
END
GO

-- 呼叫 stored procedure  getClubMember()

declare
@countx int
exec @countx = [dbo].[getClubMember] 
select @countx;