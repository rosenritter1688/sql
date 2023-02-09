-- question 3 using datamart to analysis data
--    テーブル1
--　市場売れてたCATEGORYの順番を計算してみた。
--　順番を並び直すため、テーブルをUNPIVOTした（列を行に）
select 
      interests,
      amount
from (            --カテゴリ毎に購入学を計算した
                  select 
                        sum(book_cd_dvd_total) as Book_CD_DVD,
                        sum(fashion_total) as Fashion,
                        sum(food_total) as Food,
                        sum(necessities_total) as Necessities,
                        sum(sports_total) as Sports
                  from `data-sci-acad-learn-sql.TW14_N10.datamart`
)
unpivot(
      amount for 
      interests in (Book_CD_DVD,Fashion,Food,Necessities,Sports)
)
order by amount DESC;