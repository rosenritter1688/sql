create table if not exists `data-sci-acad-learn-sql.TW14_N10.sql_school_kadai2` AS 
--　table user_tran と　shop_userをleft join　していきます。
select 
      shop_user.*,
      --　left join tableのコラムを選択します
      user_tran_sum.category,
      user_tran_sum.sub_total,
      --　user年齢層を計算します
      format("%02d" , cast( ( floor(shop_user.age / 10 ) * 10 ) as INT64 ) ) || "-" ||
      format("%02d" , cast( ( ( floor(shop_user.age / 10 ) + 1 ) * 10 ) as INT64 ) )  AS age_group
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
