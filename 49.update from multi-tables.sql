--! challenage abt my work is not done  --?if wanna update none as well  NONE       19          NO club

Table – Geeks1

col1	col2	col3
1	    11  	FIRST
11	    12  	SECOND
21     	13	    THIRD
31	    14	    FOURTH

Table – Geeks2
col1	col2	col3
1	    21	    TWO-ONE
11	    22	    TWO-TWO
21	    23	    TWO-THREE
31	    24	    TWO-FOUR

/*
Example –

We have table Geeks2 which has two rows where Col 1 is 21 & 31 
and we want to update the value from table Geeks2 to table Geeks1 
for the rows where Col 1 is 21 and 31. 
Also, we want to update the values of Col 2 and Col 3 only.
*/



UPDATE Geeks1  
SET col2 = Geeks2.col2,  
col3 = Geeks2.col3  
FROM Geeks1  
INNER JOIN Geeks2 ON Geeks1.col1 = Geeks2.col1  
WHERE Geeks1.col1 IN (21, 31);


--RESULT
FROM Geeks1;

Table – Geeks1
col1	col2	col3
1	    11	    FIRST
11	    12  	SECOND
21  	*23     *TWO-THREE
31	    *24 	*TWO-FOUR
 
FROM Geeks2;

Table – Geeks2
col1	col2	col3
1	    21	    TWO-ONE
11	    22	    TWO-TWO
21	    23	    TWO-THREE
31	    24	    TWO-FOUR



---my work

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