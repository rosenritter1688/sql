create table #temp (std_id nchar (10))
insert into #temp(std_id)
select 'S001'
union (select 'S0002')
union (select 'S0003')


select * from #temp

--result

std_id
----------
S0002     
S0003     
S001      