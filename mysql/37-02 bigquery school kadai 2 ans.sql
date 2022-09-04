DROP TABLE IF EXISTS `data-sci-acad-learn-sql.TW14_N10.datamart`;
CREATE TABLE IF NOT EXISTS `data-sci-acad-learn-sql.TW14_N10.datamart` AS
--　table user_tran と　shop_userをleft join　していきます。
--  user年齢層を計算します
SELECT
    shop_user.*,
    summary_tran.food_amount,
    summary_tran.sports_amount,	
    summary_tran.fashion_amount,	
    summary_tran.necessities_amount,	
    summary_tran.Book_CD_DVD_amount,
    summary_tran.total,
    CONCAT(
        FORMAT( "%02d", CAST( ( FLOOR(shop_user.age / 10) * 10 ) as INT64) ),
        "-",
        FORMAT( "%02d", CAST( ( ( FLOOR(shop_user.age / 10) + 1 ) * 10 - 1 ) as INT64) )
    ) AS age_group

FROM
    `data-sci-acad-learn-sql.TW14_N10.shop_user` AS shop_user
LEFT JOIN(
            -- CONVERTING VERTICAL TABLES INTO HORIZONTAL TABLES
            -- left join 前に
            -- ユーザー毎に、１年間の購入額（総計）を計算します
            SELECT
                user_id,
                MAX(
                    CASE WHEN sum_tran.category = "Food"
                            THEN sum_tran.total_c
                            ELSE 0
                    END
                ) AS food_amount,
                MAX(
                    CASE WHEN sum_tran.category = "Sports"
                            THEN sum_tran.total_c
                            ELSE 0
                    END
                ) AS sports_amount,
                MAX(
                    CASE WHEN sum_tran.category = "Fashion"
                            THEN sum_tran.total_c
                            ELSE 0
                    END
                ) AS fashion_amount,
                MAX(
                    CASE WHEN sum_tran.category = "Necessities"
                            THEN sum_tran.total_c
                            ELSE 0
                    END
                ) AS necessities_amount,
                MAX(
                    CASE WHEN sum_tran.category = "Book-CD-DVD"
                            THEN sum_tran.total_c
                            ELSE 0
                    END
                ) AS Book_CD_DVD_amount,
                SUM(total_c) AS total

            FROM(
                    -- ユーザー毎に、１年間の購入額（カテゴリ毎）を計算します
                    SELECT
                        user_id,
                        category,
                        sum(amount) AS total_c
                    FROM 
                        `data-sci-acad-learn-sql.TW14_N10.user_tran`
                    GROUP BY
                        user_id,
                        category
                    ORDER BY
                        user_id,
                        category
            ) sum_tran
            GROUP BY
                user_id
) AS summary_tran

ON 
    shop_user.user_id = summary_tran.user_id


-- for double checking purpose
-- U000005 total should be
-- food_total	fashion_total	sports_total	necesssities_total	book_cd_dvd_total	
-- 86580.0	    33770.0	        22060.0	        12240.0	            1870.0	            
-- total	    age_group
-- 156520.0	    50-59 
-- WHERE
--    shop_user.user_id = "U000005"