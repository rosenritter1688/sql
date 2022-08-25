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
-- something wrong error Syntax error: Illegal input character "\346" at [2:34]
SELECT 
      non_holiday.avetemp_kbn AS 気温区分,
      CASE
            WHEN non_holiday.rainflag = 0
                  THEN 降ってない
                  ELSE 降った
      END AS 雨,
      non_holiday.avg_daily_revenue_non_holiday AS 平日 + avg_revenue     
      holiday.daily_avg_revenue_holiday AS 休日 + avg_revenue
FROM 
      `data-sci-acad-learn-sql.TW14_N10.avg_daily_revenue_non_holiday` AS non_holiday
FULL JOIN
      `data-sci-acad-learn-sql.TW14_N10.avg_daily_revenue_holiday` AS holiday
ON 
      non_holiday.avetemp_kbn = holiday.avetemp_kbn
      AND
      non_holiday.rainflag = holiday.rainflag

