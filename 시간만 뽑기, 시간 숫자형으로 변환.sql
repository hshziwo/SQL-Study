select hour, count(hour) as count
from
(
SELECT to_number(to_char(datetime, 'hh24')) as hour -- 이줄 확인
from animal_outs
)
where hour between 9 and 19
group by hour 
order by hour asc


-- 제대로된 정답
SELECT to_number(to_char(DATETIME,'hh24')) as HOUR, count(*) as COUNT
from ANIMAL_OUTS 
where to_char(DATETIME,'hh24:mi') between '09:00' and '19:59'
group by to_char(DATETIME,'hh24') 
order by HOUR;