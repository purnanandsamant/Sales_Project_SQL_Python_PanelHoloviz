with 
cte1 as (SELECT t.*, dt.*
FROM transactions as t 
INNER JOIN date as dt on t.order_date = dt.date),
cte2 as (SELECT cte1.*, cc.custmer_name, cc.customer_type
FROM cte1
JOIN customers as cc on cte1.customer_code = cc.customer_code),
cte3 as (SELECT cte2.*, mk.markets_name, mk.zone
FROM cte2
JOIN markets as mk on cte2.market_code = mk.markets_code),
cte4 as (SELECT CTE3.*, p.product_type
FROM cte3
LEFT JOIN products as p USING (product_code))
SELECT count(*) FROM cte4;