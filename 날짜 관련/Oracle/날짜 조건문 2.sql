SELECT book_id, to_char(published_date, 'yyyy-mm-dd') as published_date
from book
where published_date between to_date('2021-01-01', 'yyyy-mm-dd') and to_date('2021-12-31', 'yyyy-mm-dd')
and category = '인문'
order by published_date asc