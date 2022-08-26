--? EX: getdate(), datepart(), Year(), Month(), Day()

declare @myTime datetime
set @myTime = getdate()
select datepart (year ,getdate()),datepart(month ,@myTime), day(@myTime),
datepart(hour ,getdate ()),datepart(minute,getdate ()), datepart(second ,getdate ()), datepart(QUARTER ,getdate())

/*
 Getdate(): 目前的日期時間
 Datepart( 部分參數 , datetime 格式 datetime 格式有 Year, Month, Day, Hour, Minute, Second, Quarter
 Year(datetime 格式 ): 取年 ; month(), month(), 亦同 , 沒有 Hour(), Minute(), Second()
*/


declare @myTime datetime
set @myTime = getdate()
select datepart (year ,getdate()),datepart(month ,@myTime), day(@myTime),
datepart(hour ,getdate ()),datepart(minute,getdate ()), datepart(second ,getdate ()), datepart(QUARTER ,getdate())

/*
 Getdate(): 目前的日期時間
 Datepart( 部分參數 , datetime 格式 datetime 格式有 Year, Month, Day, Hour, Minute, Second, Quarter
 Year(datetime 格式 ): 取年 ; month(), month(), 亦同 , 沒有 Hour(), Minute(), Second()
*/

--RESULT
----------- ----------- ----------- ----------- ----------- ----------- -----------
2021        
3           
13          
17          
27          
27          
1


(1 個資料列受到影響)
