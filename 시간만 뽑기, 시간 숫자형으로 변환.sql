select hour, count(hour) as count
from
(
SELECT to_number(to_char(datetime, 'hh24')) as hour -- 이줄 확인
from animal_outs
)
where hour between 9 and 19
group by hour 
order by hour asc