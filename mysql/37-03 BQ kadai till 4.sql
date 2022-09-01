drop table if exists `data-sci-acad-learn-sql.TW14_N10.sql_school_kadai2`;

create table if not exists `data-sci-acad-learn-sql.TW14_N10.sql_school_kadai2` AS 
--　table user_tran と　shop_userをleft join　していきます。
select 
      shop_user.*,
      --　left join tableのコラムを選択します
      user_tran_sum.category,
      user_tran_sum.sub_total,
      --　user年齢層を計算します
      format("%02d" , cast( ( floor(shop_user.age / 10 ) * 10 ) as INT64 ) ) || "-" ||
      format("%02d" , cast( ( ( ( floor(shop_user.age / 10 ) + 1 ) * 10 ) - 1 ) as INT64 ) )  AS age_group
from
      `TW14_N10.shop_user` AS shop_user
left join(
          -- left join 前に
          -- ユーザー毎に、１年間の購入額（カテゴリ毎、総計）を計算します
          select
                user_id,
                category,
                sum(amount) AS sub_total
          from
                `TW14_N10.user_tran`
          group by
                user_id,
                category
          order by
                user_id,
                category
) AS user_tran_sum
ON 
  shop_user.user_id = user_tran_sum.user_id;




select * from `data-sci-acad-learn-sql.TW14_N10.sql_school_kadai2`;
-- kadai 3

select
      category,
      concat(
        "￥",
        format("%'d",total) 
      ) AS total
      
from (
        select
              category,
              sum(sub_total) AS total
        from
              `data-sci-acad-learn-sql.TW14_N10.sql_school_kadai2`
        group by
              category
        order by
              total DESC
)

-- 'Food',        '11,188,880'
-- 'Sports',       '2,781,320'
-- 'Necessities', ' 2,726,720'
-- 'Fashion',      '2,681,490'
-- 'Book-CD-DVD',    '799,360'

-- kadai 3 part 2


select  
      round(avg(sports),2) AS sports,
      ROUND(AVG(WatchingSports),2) AS WatchingSports,
      ROUND(AVG(travel),2) AS travel,
      ROUND(AVG(mobility),2) AS mobility,
      ROUND(AVG(reading),2) AS reading,
      ROUND(AVG(music),2) AS music,
      ROUND(AVG(movie),2) AS movie,
      ROUND(AVG(computer),2) AS computer,
      ROUND(AVG(game),2) AS game,
      ROUND(AVG(gamble),2) AS gamble
from `data-sci-acad-learn-sql.TW14_N10.sql_school_kadai2`

-- Row 	sports	WatchingSports	travel	mobility	reading	music	movie	computer	game	gamble	
-- 1	    1.64    1.36            1.55    1.4       2.75    2.32  2.51  2.86      1.99  1.48
	
-- 客に最も興味のある分野はcomputer(2.86)、reading(2.75)、movie(2.51)、music(2.32)、game(1.99)でわかり、それに対する業務と品揃えをしていくの良いでしょう。

-- kadai part 3
-- 
select 
      age_group,
      gender,
      sum(sub_total) AS sub_total
from 
      `data-sci-acad-learn-sql.TW14_N10.sql_school_kadai2`
group by
      age_group,
      gender
order by
      sub_total DESC,
      gender;

-- ご来店のお客様の年齢層は40代の男女、30代の男女、50代の男女、60代の女性、20代の男女が多くて、特に40代と30代のお客さんの来店数が一番多いのはわかりました。
-- ですので、40代と30代のお客さんの趣味を見たほうが良さそうだと思います。


-- 40代のお客さんの趣味
SELECT
      "40-49" AS age_group,
      ROUND(AVG(sports),2) AS sports,
      ROUND(AVG(WatchingSports),2) AS WatchingSports,	
      ROUND(AVG(travel),2) AS travel,	
      ROUND(AVG(mobility),2) AS mobility,	
      ROUND(AVG(reading),2) AS reading,	
      ROUND(AVG(music),2) AS music,	
      ROUND(AVG(movie),2) AS movie,	
      ROUND(AVG(computer),2) AS computer,	
      ROUND(AVG(game),2) AS game,	
      ROUND(AVG(gamble),2) AS gamble

FROM `data-sci-acad-learn-sql.TW14_N10.shop_user`
where age between 40 and 49
-- customers of around 40 are more interested about 
-- 1. computer 2.98
-- 2. reading  2.38
-- 3. movie    2.29
-- 4. game     2.19
-- 5. music    2.12

-- 30代のお客さんの趣味
SELECT
      "30-39" AS age_group,
      ROUND(AVG(sports),2) AS sports,
      ROUND(AVG(WatchingSports),2) AS WatchingSports,	
      ROUND(AVG(travel),2) AS travel,	
      ROUND(AVG(mobility),2) AS mobility,	
      ROUND(AVG(reading),2) AS reading,	
      ROUND(AVG(music),2) AS music,	
      ROUND(AVG(movie),2) AS movie,	
      ROUND(AVG(computer),2) AS computer,	
      ROUND(AVG(game),2) AS game,	
      ROUND(AVG(gamble),2) AS gamble

FROM `data-sci-acad-learn-sql.TW14_N10.shop_user`
where age between 30 and 39
-- customers of around 30 are more interested about 
-- 1. computer 2.88
-- 2. reading  2.78
-- 3. movie    2.46
-- 4. music    2.22
-- 5. game     2.15


-- around 30 and 40 are all interested about  computer and reading and movie and music and game
-- maybe it would be better to prepare more products about these 5 categories especially aiming that 2 group

-- 
SELECT
      "40-49" AS age_group,
      ROUND(AVG(reading),2) AS reading,	
      ROUND(AVG(music),2) AS music,	
      ROUND(AVG(movie),2) AS movie,	
      ROUND(AVG(computer),2) AS computer,	
      ROUND(AVG(game),2) AS game,	
FROM `data-sci-acad-learn-sql.TW14_N10.shop_user`
where age between 40 and 49
-- CANT USE UNION MUST USE UNION ALL
UNION all(
                  SELECT
                        "30-39" AS age_group,	
                        ROUND(AVG(reading),2) AS reading,	
                        ROUND(AVG(music),2) AS music,	
                        ROUND(AVG(movie),2) AS movie,	
                        ROUND(AVG(computer),2) AS computer,	
                        ROUND(AVG(game),2) AS game
                  FROM `data-sci-acad-learn-sql.TW14_N10.shop_user`
                  where age between 30 and 39
)
-- COZ SALES ON BOOK-CD-DVD ARE THE LOWEST, SO IT MIGHT BE COZ OF CURRENT TECHNOLOGY,
-- SO MAYBE WE SHOULD FOCUS ON SPORT AND NECESSITIES AND FASHION
-- 'Sports',       '2,781,320'
-- 'Necessities', ' 2,726,720'
-- 'Fashion',      '2,681,490'
SELECT 
      age_group,
      gender,
      category,
      sum(sub_total) AS total
FROM 
      `data-sci-acad-learn-sql.TW14_N10.sql_school_kadai2`
WHERE
      category <> "Food"
GROUP BY
      age_group,
      gender,
      category
order by
      total DESC
limit 10;


-- 40-49 F Necessitiesm,Fashion,Sports
-- 30-39 M Sports,Fashion,Necessities
-- 30-39 F Necessities,Sports,Fashion
-- 40-49 M Fashion
-- top 10 buyers are from 30~49, we should study and do some research about what they like

-- KADAI 4
select
      user_id,
      sum(sub_total) AS total,
      CASE WHEN Row
FROM 
      `data-sci-acad-learn-sql.TW14_N10.sql_school_kadai2`
GROUP BY 
      user_id
