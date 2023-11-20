select b.author_id, b.author_name, b.category, sum(a.sales * b.price) as total_sales
from
(
SELECT *
from book_sales
where to_char(sales_date, 'yyyymm') = '202201'
) a left join
(
select a.book_id, a.category, a.author_id, b.author_name, a.price
from book a left join author b
on a.author_id = b.author_id
) b
on a.book_id = b.book_id
group by b.author_id, b.author_name, b.category
order by author_id asc, category desc

-- 그냥 아래처럼 세 테이블 조인해도 된다..ㅠㅠ
SELECT 
    a.author_id,a.author_name,b.category,
    sum(bs.sales * b.price) TOTAL_SALES 
from book b, author a, book_sales bs
where bs.sales_date between TO_DATE('2022-01-01','YYYY-MM-DD') and TO_DATE('2022-01-31','YYYY-MM-DD') 
and b.book_id = bs.book_id
and b.author_id = a.author_id
group by  a.author_id,a.author_name,b.category
order by author_id, category desc