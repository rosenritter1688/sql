--! DATEADD (datepart , number , date ) 得到設定的時間後的時間
        --Datepart( 部分參數 , datetime 格式 datetime 格式有 Year, Month, Day, Hour, Minute, Second, Quarter
declare @myTime datetime
Set @myTime= cast( '2020-1-1' as datetime) --cast is like function convert
select dateadd(month, 5 , @myTime)