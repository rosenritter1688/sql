select year(getdate())
--2021

declare @month int
--declare @year int
set @month=year(getdate())
select @month -1911
--110
select convert(int,year(getdate())) - 1911
--110