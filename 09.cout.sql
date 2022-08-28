SELECT SUBJECT, YEAR, Count(*)   -- count those year are the same
FROM Student
GROUP BY SUBJECT, YEAR;