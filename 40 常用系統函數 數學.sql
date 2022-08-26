--Ex: Round 四捨五入   
print '-------rcd * 1.22---------------'
select rcd * 1.22, round(rcd * 1.22, 0), round(rcd * 1.22, 1), round(rcd , 1.22 , 2) 

select round(rcd * 1.22, 0) -- 四捨五入 0 decimal 

select round(rcd * 1.22, 1) -- 四捨五入 1 decimal 

select round(rcd * 1.22, 2) -- 四捨五入 2 decimals