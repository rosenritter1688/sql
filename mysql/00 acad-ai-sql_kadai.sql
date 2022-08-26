-- union all , and create table order_report
CREATE table if not exists `data-sci-acad-learn-sql.TW14_N10.order_report` AS
select *
from 
  `data-sci-acad-learn-sql.TW14_N10.order_report_1`
union all
      SELECT *
      FROM `data-sci-acad-learn-sql.TW14_N10.order_report_2`

-- DROP TABLE IF EXISTS order_report
DROP TABLE IF EXISTS `data-sci-acad-learn-sql.TW14_N10.order_report`;

-- UNION ALL 2 tables order_report_1 and order_report_2,
-- caculate total revenue for each day
-- and create a table named daily_amount

CREATE TABLE IF NOT EXISTS `data-sci-acad-learn-sql.TW14_N10.daily_amount` AS
select 
      order_report.date_ymd, --remember to type this coz group by got this
      sum(order_report.amount) AS daily_amount
from (
      SELECT
            *
      FROM  
            `data-sci-acad-learn-sql.TW14_N10.order_report_1`
      UNION ALL
            SELECT
                  *
            FROM `data-sci-acad-learn-sql.TW14_N10.order_report_2`
) as order_report
group by
      order_report.date_ymd;

--double check table daily_amount
select count(*)
from `data-sci-acad-learn-sql.TW14_N10.daily_amount`;

-- stage 3 from textbook
--table daily_amount left join weather, holiday_master;
-- create a table name ice_datamart

create table if not exists `data-sci-acad-learn-sql.TW14_N10.ice_datamart` AS
select 
      daily_amount.date_ymd,
      daily_amount.daily_amount AS amount,
      weather.weekday,
      weather.avetemp,
      weather.totprecip,
      holiday_master.public_holiday
from
      `data-sci-acad-learn-sql.TW14_N10.daily_amount` as daily_amount
left join
      `data-sci-acad-learn-sql.TW14_N10.weather` as weather
      on daily_amount.date_ymd = weather.date_ymd
left join
      `data-sci-acad-learn-sql.TW14_N10.holiday_master` as holiday_master
      on daily_amount.date_ymd = holiday_master.date_ymd;
--check ice_datamart
select *
from `data-sci-acad-learn-sql.TW14_N10.ice_datamart`;


-- stage4
/*以下の項目を作成する。
・気温区分：気温を5℃毎に分けた区分
・雨フラグ：降雨量が0より大きければ1、0なら0
・休日フラグ：土日祝ならば1、そうでなければ0
create table temp_calc
*/

#Row	date_ymd	  amount	weekday	avetemp	totprecip	public_holiday	
#1	  2017-03-03  86800   Fri     8.7     0         null

-- LPAD 
-- add leading zeros 
-- LPAD(VALUE, NUMBER_OF_STRING, '0' )  > '0' 

-- CAST
-- CHANGE DATA TYPE

CREATE TABLE IF NOT EXISTS `data-sci-acad-learn-sql.TW14_N10.temp_calc` AS
SELECT
      date_ymd,
      CONCAT(
              LPAD( CAST( ( FLOOR( avetemp / 5 ) * 5 ) AS STRING),2,'0'),
              '-',
              LPAD( CAST( ( ( FLOOR( avetemp / 5 ) + 1 ) * 5 ) AS STRING),2,'0')

            ) AS avetemp_kbn,
      CASE
          WHEN totprecip > 0
               THEN 1
               ELSE 0
      END AS rain_flag,

      CASE                                                         -- cant use <> Null, != Null 
          WHEN weekday = "Sat" OR weekday = "Sun" OR public_holiday <> 'Null'
                THEN 1
                ELSE 0
          END AS holiday_flag,
      amount

from `data-sci-acad-learn-sql.TW14_N10.ice_datamart`;

-- use != Null or <> Null
-- will get the same error
-- Operands of <> cannot be literal NULL at [3:25]
-- i quess coz in BQ <> and != is only for compareable 



-- 提出課題②
-- order_report_1 に weather を左外部結合した上で、雨の降っていない日
-- のデータのみを抽出して、その件数（注文件数＝order_report_1 上での
-- 件数）を調べてください。

select count(*)
from (
        select *
        from `data-sci-acad-learn-sql.TW14_N10.order_report_1` as order_report_1
        left join
            `data-sci-acad-learn-sql.TW14_N10.weather` as weather
            on order_report_1.date_ymd = weather.date_ymd
        order by
                order_report_1.order_id
) as temp_table
where temp_table.totprecip <= 0;

/* stage 4
⑤ 以下の通り集計して、目的の表を得る。
1. 休日フラグ0のデータを抽出し、気温区分と雨フラグ毎に１日売上の平均値を取得
2. 休日フラグ1のデータを抽出し、気温区分と雨フラグ毎に１日売上の平均値を取得
3. 1 と 2 のデータを完全外部結合す
*/



-- 1. 休日フラグ0のデータを抽出し、気温区分と雨フラグ毎に１日売上の平均値を取得
-- CREATE VIEW avg_daily_revenue_non_holiday
DROP VIEW IF EXISTS `data-sci-acad-learn-sql.TW14_N10.avg_daily_revenue_non_holiday`;

CREATE VIEW IF NOT EXISTS `data-sci-acad-learn-sql.TW14_N10.avg_daily_revenue_non_holiday` AS
SELECT
      temp_calc.avetemp_kbn,
      temp_calc.rainflag,
      FORMAT("%'d", CAST( AVG ( amount_day ) AS INT64 ) ) AS avg_daily_revenue_non_holiday

FROM 
      `data-sci-acad-learn-sql.TW14_N10.temp_calc` as temp_calc
WHERE 
      -- error msg
      -- cant use temp_calc.holiday_flag = 0  
      -- No matching signature for operator = for argument types: STRING, INT64. 
      -- Supported signature: ANY = ANY at [8:7]
      -- holiday_flag data type is string
      temp_calc.holiday_flag = '0'
GROUP BY
      temp_calc.avetemp_kbn,
      temp_calc.rainflag
ORDER BY
      temp_calc.avetemp_kbn
-- CHECKING VIEW `data-sci-acad-learn-sql.TW14_N10.avg_daily_revenue_non_holiday`
SELECT *
FROM `data-sci-acad-learn-sql.TW14_N10.avg_daily_revenue_non_holiday` AS revenue_non_holiday


--2. 休日フラグ1のデータを抽出し、気温区分と雨フラグ毎に１日売上の平均値を取得
-- CREATE VIEW avg_daily_revenue_holiday
CREATE VIEW IF NOT EXISTS `data-sci-acad-learn-sql.TW14_N10.avg_daily_revenue_holiday` AS
SELECT
      temp_table.avetemp_kbn,
      temp_table.rainflag,
      --format int like currency
      FORMAT(
            "%'d",
            -- CAST FLOAT TO INT64 會四捨五入
            CAST( AVG(temp_table.amount_day) AS INT64 )
      ) AS daily_avg_revenue_holiday
      
FROM 
      `data-sci-acad-learn-sql.TW14_N10.temp_calc` as temp_table
WHERE
      temp_table.holiday_flag = '1'
GROUP BY
      temp_table.avetemp_kbn,
      temp_table.rainflag
ORDER BY 
      temp_table.avetemp_kbn

-- CHECKING avg_daily_revenue_holiday
SELECT *
FROM `data-sci-acad-learn-sql.TW14_N10.avg_daily_revenue_holiday`


-- 3. 1 と 2 のデータを完全外部結合する avg_daily_revenue_holiday and avg_daily_revenue_non_holiday
-- column name cant use japanese
-- its done as same as page p.77
SELECT 
      non_holiday.avetemp_kbn,
      CASE WHEN non_holiday.rainflag = '0'
            THEN "降ってない"
            ELSE "降った"
      END AS rain_flg,  -- after end as cant use japanese here
      non_holiday.avg_daily_revenue_non_holiday AS avg_revenue_non_holiday,
      holiday.daily_avg_revenue_holiday AS avg_revenue_holiday
FROM
      `data-sci-acad-learn-sql.TW14_N10.avg_daily_revenue_holiday` AS holiday
FULL JOIN
      `data-sci-acad-learn-sql.TW14_N10.avg_daily_revenue_non_holiday` AS non_holiday
ON
      holiday.avetemp_kbn = non_holiday.avetemp_kbn 
      AND
      holiday.rainflag = non_holiday.rainflag
ORDER BY
      non_holiday.avetemp_kbn,
      non_holiday.rainflag
--kadai 3
--15～20[℃]で、雨が降っている平日の平均注文数を入力してください。


--setp 4 create table for weekday and holiday
--CREATE TABLE IF NOT EXISTS `data-sci-acad-learn-sql.TW14_N10.kadai3_datamart_weekday` AS
CREATE TABLE IF NOT EXISTS `data-sci-acad-learn-sql.TW14_N10.kadai3_datamart_holiday` AS
SELECT
      *
FROM (
      -- SETP 3 LEFT JOIN table weather , holiday_master,気温を5℃毎に区切る,雨が降ったか降ってないかに分類する
      SELECT 
            daily_orders.*,
            FORMAT("%02d", CAST((FLOOR( weather.avetemp / 5 ) * 5) AS INT64 ) )  || '-' || 
            FORMAT("%02d", CAST(((FLOOR( weather.avetemp / 5 ) + 1 ) * 5 ) AS INT64 ) ) AS temp_kbn,
            CASE WHEN weather.totprecip > 0
                  THEN "降った"
                  ELSE "降ってない"
            END AS rain_flag,
            CASE WHEN weather.weekday = "Sat" OR weather.weekday = "Sun" OR holiday_master.public_holiday IS NOT NULL
                  THEN "休日"
                  ELSE "平日"
            END AS holiday_flag
      FROM (
            SELECT -- STEP 2, COUNT TOTAL ORDER PER DAY
                  daily_orders.date_ymd,
                  COUNT(daily_orders.date_ymd) AS orders
            FROM (
                  SELECT  -- STEP 1, UNION ALL 
                        *
                  FROM 
                        `data-sci-acad-learn-sql.TW14_N10.order_report_1`
                  UNION ALL
                        SELECT 
                              *
                        FROM
                              `data-sci-acad-learn-sql.TW14_N10.order_report_2`
            )AS daily_orders -- FOR STEP 2
            GROUP BY
                  daily_orders.date_ymd
      ) AS daily_orders -- FOR STEP 3
      LEFT JOIN
            `data-sci-acad-learn-sql.TW14_N10.weather` AS weather 
      ON
            daily_orders.date_ymd = weather.date_ymd
      LEFT JOIN
            `data-sci-acad-learn-sql.TW14_N10.holiday_master` AS holiday_master
      ON
            daily_orders.date_ymd = holiday_master.date_ymd

) AS temp_table
WHERE
      temp_table.holiday_flag = "平日"

--STEP 5 
-- CACULATE AVG ORDER for weekday and save it to kadai3_temp_calc_weekday
drop table `data-sci-acad-learn-sql.TW14_N10.kadai3_temp_calc_weekday`;
create table if not exists `data-sci-acad-learn-sql.TW14_N10.kadai3_temp_calc_weekday` AS
select 
      TRUNC(  -- TAKE DECIMAL 2 PLACE
            ROUND(avg(orders),2), -- ROUND UP DECIMAL 2 PLACE
            2) AS weekday_avg_orders,
      temp_kbn,
      rain_flag
from 
      `data-sci-acad-learn-sql.TW14_N10.kadai3_datamart_weekday`
group by
      temp_kbn,
      rain_flag
order by
      temp_kbn
--STEP 6 
-- CACULATE AVG ORDER for holiday and save it to kadai3_temp_calc_holiday
create table if not exists `data-sci-acad-learn-sql.TW14_N10.kadai3_temp_calc_holiday` AS
select 
      TRUNC(  -- TAKE DECIMAL 2 PLACE
            ROUND(avg(orders),2), -- ROUND UP DECIMAL 2 PLACE
            2) AS holiday_avg_orders,
      temp_kbn,
      rain_flag
from 
      `data-sci-acad-learn-sql.TW14_N10.kadai3_datamart_holiday`
group by
      temp_kbn,
      rain_flag
order by
      temp_kbn



-- STEP 7
-- FULL JOIN TABLES kadai3_datamart_holiday,kadai3_datamart_weekday
-- FYI, mysql got not full join but left join + union + right join = full join

SELECT 
      weekday.temp_kbn,
      weekday.rain_flag,
      weekday.weekday_avg_orders,
      holiday.holiday_avg_orders
FROM
      `data-sci-acad-learn-sql.TW14_N10.kadai3_temp_calc_holiday` AS holiday
FULL JOIN
-- NO FROM
      `data-sci-acad-learn-sql.TW14_N10.kadai3_temp_calc_weekday` AS weekday
ON
      holiday.rain_flag = weekday.rain_flag
      AND
      holiday.temp_kbn = weekday.temp_kbn
order by 
      weekday.temp_kbn,
      weekday.rain_flag

