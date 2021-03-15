-- 科目C001全部加10分
UPDATE record --updatet table record
set rcd = rcd + 10
WHERE course_id = 'C001';
