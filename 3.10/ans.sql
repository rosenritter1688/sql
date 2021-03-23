/*
在club增加欄位members int, 用來記載社團的人數
1.設計stored procedure  getClubMember(), 利用 update from multi table的技術更新members
2.設計Trigger, 只要Club_Action_Member有變動都更新Table:club的members
*/

1.
alter table club add  members int;

create procedure getClubMember
as
begin
  create table #temp(club_id varchar(10), member int)
  
  insert into #temp(club_id, member)
  select a.club_id, count(*) 
  from club_action_member m, club_action a
  where a.act_id = a.act_id
  group by a.club_id
  
  update club set members=t.member
  from #temp t, club c
  where t.club_id = c.club_id
end

exec getClubMember;
select * from club
2.
create trigger Tg_Club_Action_Member  on club_action_member for insert, update, delete
as
begin
   exec dbo.getClubMember;
end