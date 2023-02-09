SELECT
      "40-49" AS age_group,  -- adding a new column named age_group and with value "40-49"
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
--       