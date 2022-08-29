-- left join combine 2 tables user_tran, shop_user
-- mysql version

CREATE TABLE IF NOT EXISTS sql_school_datamart
SELECT
            su.UserID AS user_id,
            su.Age AS age,
            CONCAT(
                   LPAD((floor(age / 10 ) * 10) ,2,0),
                   "-",
                   LPAD(((floor(age / 10 ) + 1 ) * 10) ,2,0)
            ) AS age_group,
            su.Gender AS gender,
            su.Sports AS sports,
            su.WatchingSports AS WatchingSports,
            su.Travel AS travel,
            su.Mobility AS mobility,
            su.Reading AS reading,
            su.Music AS music,
            su.Movie AS movie,
            su.Computer AS computer,
            su.Game AS game,
            su.Gamble AS gamble,
            ut.Date AS day_buy,
            ut.Category AS category,
            ut.Amount AS amount
FROM 
            shop_user AS su
LEFT JOIN
            user_tran AS ut
ON
            su.UserID = ut.UserID
            



-- bigquery version

-- step 3 create table 
CREATE TABLE IF NOT EXISTS `data-sci-acad-learn-sql.TW14_N10.datamart_schooling_q2` AS
SELECT 
    su_with_age_group.user_id,
    su_with_age_group.age,
    su_with_age_group.age_group,
    su_with_age_group.gender,
    su_with_age_group.sports	,
    su_with_age_group.WatchingSports,
    su_with_age_group.travel,
    su_with_age_group.mobility,	
    su_with_age_group.reading,	
    su_with_age_group.music,	
    su_with_age_group.movie,	
    su_with_age_group.computer,	
    su_with_age_group.game,
    su_with_age_group.gamble,
    ut.date_buy,
    ut.category,
    ut.amount	
FROM (
      SELECT--STEP1, CREATE age_group
            *,
            FORMAT("%02d",CAST( (FLOOR(age / 10) * 10) AS INT64 ) ) ||"-" ||
            FORMAT("%02d",CAST( ((FLOOR(age / 10) + 1 )* 10) AS INT64 ) ) AS age_group
      FROM `data-sci-acad-learn-sql.TW14_N10.shop_user`
) AS su_with_age_group
-- step 2 left join table user_tran
LEFT JOIN
    `data-sci-acad-learn-sql.TW14_N10.user_tran` AS ut

ON
    su_with_age_group.user_id = ut.user_id



    

select * from 
`data-sci-acad-learn-sql.TW14_N10.datamart_schooling_q2`

select * from 
`data-sci-acad-learn-sql.TW14_N10.user_tran`