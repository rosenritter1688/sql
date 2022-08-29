select
      *
from  
      `data-sci-acad-learn-sql.TW14_N10.L_PURCHASE` as l
full join
      `data-sci-acad-learn-sql.TW14_N10.m_product` as m
on 
      l.P_CODE = m.P_CODE