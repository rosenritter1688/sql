--? EX: getdate(), datepart(), Year(), Month(), Day()

/*
 Getdate(): 目前的日期時間
 Datepart( 部分參數 , datetime 格式）
　　　　　　　　　　　　 datetime 格式有 Year, Month, Day, Hour, Minute, Second, Quarter
 Year(datetime 格式 ): 取年 ; month(), month(), 亦同 , 
　　　　　　　　　　　　　--!沒有 Hour(), Minute(), Second()
*/


declare @myTime datetime
set @myTime = getdate()
select datepart(year ,getdate()),   --2021
       datepart(month ,@myTime),    --3
       day(@myTime),                --13
       datepart(hour ,getdate ()),  --17
       datepart(minute,getdate ()), --27
       datepart(second ,getdate ()),--27 
       datepart(QUARTER ,getdate()) --1

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
