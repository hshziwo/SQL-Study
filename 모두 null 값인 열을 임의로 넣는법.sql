select to_char(sales_date, 'yyyy-mm-dd') as sales_date, product_id, user_id, sales_amount
from
(
SELECT sales_date, product_id, NULL as user_id, sales_amount
from offline_sale
where to_char(sales_date, 'yyyy-mm') = '2022-03'
union all
select sales_date, product_id, user_id, sales_amount
from online_sale
where to_char(sales_date, 'yyyy-mm') = '2022-03'
)
order by sales_date asc, product_id asc, user_id asc