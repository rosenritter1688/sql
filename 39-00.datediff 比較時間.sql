--! DATEDIFF ( datepart , startdate , enddate ) 兩時間差
      --Datepart( 部分參數 , datetime 格式 datetime 格式有 Year, Month, Day, Hour, Minute, Second, Quarter 季
      --Year(datetime 格式 ): 取年 ; month(), month(), 亦同 , 沒有 Hour(), Minute(), Second()
      --Getdate(): 目前的日期時間
declare @myTime1 datetime;
declare @myTime2 datetime
set @myTime1= convert(datetime, '2020-1-1');
set @myTime2= cast( '2020-10-1' as datetime)
select datediff (Year , @myTime1, @myTime2) as datediff_in_yr, 
       datediff(Month, @myTime1, @myTime2) as datediff_in_month,
       datediff(Day, @myTime1, @myTime2) as datediff_in_day,
       datediff(Hour, @myTime1, @myTime2) as datediff_in_hour
/*
datediff_in_yr datediff_in_month datediff_in_day datediff_in_hour
-------------- ----------------- --------------- ----------------
0              9                 274             6576
*/

--?sample 2 
declare @myTime1 datetime;
declare @myTime2 datetime
set @myTime1= convert(datetime, '2020-1-1');
set @myTime2= cast( '2020-10-1' as datetime)
