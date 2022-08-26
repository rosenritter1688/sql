EX:
DATEDIFF ( datepart , startdate , enddate ) 兩時間差
declare @myTime1 datetime;
declare @myTime2 datetime
set @myTime1= convert(datetime, '2020
1 1');
set @myTime2= cast( '2020
10 1' as datetime)
select
datediff Year , @myTime1 , @myTime2 ), datediff(Month, @myTime1, @
,datediff(Day, @myTime1, @myTime2),datediff(Hour, @myTime1, @myTime2)
EX:
DATEADD (datepart , number , date ) 得到設定的時間後的時間
declare @myTime datetime
Set @myTime= cast( '2020
1 1' as datetime)
select dateadd(month, 5 , @myTime)