
drop table if exists `data-sci-acad-learn-sql.TW14_N10.datamart`;


create table `data-sci-acad-learn-sql.TW14_N10.datamart` AS
--テーブル　shop_user table と table 1 （カテゴリ毎の総額、総額）と table 2　（購入回数）left joinする
-- 年齢層を区別する
select
    --　table shop_user
    shop_user.*,
    --　table 1 カテゴリ毎の総額、総額
    total_amount.total_amount,
    sub_total_table.book_cd_dvd_total,
    sub_total_table.fashion_total,	
    sub_total_table.food_total,	
    sub_total_table.necessities_total,
    sub_total_table.sports_total,
    -- 年齢層を区別
    format("%02d",CAST((floor(shop_user.age / 10)  * 10) AS int64)) || "-" ||
    format("%02d",CAST(((floor(shop_user.age / 10) + 1 )  * 10 - 1) AS int64)) as age_group,
    -- table 2 購入回数
    purchase_no.total_buy_number,
    purchase_no.Book_CD_DVD_buy_number,
    purchase_no.Fashion_buy_number,
    purchase_no.Food_buy_number,
    purchase_no.Necessities_buy_number,
    purchase_no.Sports_buy_number

from 
    `data-sci-acad-learn-sql.TW14_N10.shop_user` AS shop_user
-- LEFT JOIN テーブル1
left join (
      -- テーブル　1
      -- STEP 3　総額を集計し、カテゴリ毎の総額とLEFT JOINする

      select
            user_id,
            sum(amount) AS total_amount
      from `data-sci-acad-learn-sql.TW14_N10.user_tran` AS user_tran
      group by
            user_tran.user_id
) AS total_amount
ON
    shop_user.user_id = total_amount.user_id

left join ( 
        -- テーブル　1
        --　step ２ pivot テーブル(行を列に)
        select
              amount_summary_c.user_id,
              MAX(CASE WHEN amount_summary_c.category = "Book-CD-DVD"
                        THEN amount_summary_c.sub_total
                        ELSE 0
                  END) AS book_cd_dvd_total,
              MAX(CASE WHEN amount_summary_c.category = "Fashion"
                        THEN amount_summary_c.sub_total
                        ELSE 0
                  END ) AS fashion_total,
              MAX(CASE WHEN amount_summary_c.category = "Food"
                        THEN amount_summary_c.sub_total
                        ELSE 0
                  END ) AS food_total,
              MAX(CASE WHEN amount_summary_c.category = "Necessities"
                        THEN amount_summary_c.sub_total
                        ELSE 0
                  END ) AS necessities_total,
              MAX(CASE WHEN amount_summary_c.category = "Sports"
                        THEN amount_summary_c.sub_total
                        ELSE 0
                  END ) AS sports_total
        from (
            -- テーブル 1 
            --　step 1
            --　カテゴリ毎の総額を集計する
              select
                    user_tran.user_id,
                    user_tran.category,
                    sum(amount) AS sub_total
              from `data-sci-acad-learn-sql.TW14_N10.user_tran` AS user_tran
              group by
                    user_tran.user_id,
                    user_tran.category
              order by
                    user_tran.user_id,
                    user_tran.category
        ) AS amount_summary_c
        -- reminder during pivot table must use group by
        group by
            amount_summary_c.user_id

) AS sub_total_table
ON 
    shop_user.user_id = sub_total_table.user_id
--　left join テーブル 2 
left join (
-- table 2
--  step 3
-- 総購入回数と集計する
select
      category_purchases.*,
      (category_purchases.Book_CD_DVD_buy_number +
       category_purchases.Fashion_buy_number +
       category_purchases.Food_buy_number +
       category_purchases.Necessities_buy_number +
       category_purchases.Sports_buy_number) AS total_buy_number
from (
              -- table ２ step 2
              -- テーブルをpivotする（行を列に）
              select
                    user_id,
                    MAX(CASE WHEN number_purchase.category = "Book-CD-DVD"
                              THEN number_purchase.number_purchases
                              ELSE 0
                        END) AS Book_CD_DVD_buy_number,
                    MAX(CASE WHEN number_purchase.category = "Fashion"
                              THEN number_purchase.number_purchases
                              ELSE 0
                        END) AS Fashion_buy_number,
                    MAX(CASE WHEN number_purchase.category = "Food"
                              THEN number_purchase.number_purchases
                              ELSE 0
                        END) AS Food_buy_number,
                    MAX(CASE WHEN number_purchase.category = "Necessities"
                              THEN number_purchase.number_purchases
                              ELSE 0
                        END) AS Necessities_buy_number,
                    MAX(CASE WHEN number_purchase.category = "Sports"
                              THEN number_purchase.number_purchases
                              ELSE 0
                        END) AS Sports_buy_number,
              from (
                    -- table ２ step 1
                    -- カテゴリ毎に購入回数を集計する。 
                    select
                          user_id,
                          category,
                          count(category) AS number_purchases
                    from `data-sci-acad-learn-sql.TW14_N10.user_tran`
                    group by
                          user_id,
                          category
                    order by
                          user_id,
                          category
              ) AS number_purchase
              GROUP BY
                    user_id
) as category_purchases
) as purchase_no
on 
      shop_user.user_id = purchase_no.user_id;
