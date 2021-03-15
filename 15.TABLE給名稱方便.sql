
select std_id, count(*) as counting,SUM(rcd),AVG(rcd) as t -- count(*)計算有出現幾次
from Record r
GROUP BY std_id                           -- 把一樣的std_id弄在同一組
HAVING AVG(rcd) > 80   --only show those whom have more than avg 80 marks
Order by t DESC,counting 