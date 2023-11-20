-- 그냥 count 안에 컬럼을 distinct 하면 됨.
SELECT to_char(a.sales_date, 'yyyy') as year, to_number(to_char(a.sales_date, 'mm')) as month, b.gender, count(distinct b.user_id) as users
from online_sale a join user_info b
on a.user_id = b.user_id
where b.gender is not null
group by to_char(a.sales_date, 'yyyy'), to_char(a.sales_date, 'mm'), b.gender
order by year,month,gender