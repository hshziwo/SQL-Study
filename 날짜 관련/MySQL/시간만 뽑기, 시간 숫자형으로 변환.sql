-- mysql에서는 month(), day() year(), hour(), minute(), second() 등의 함수를 쓰면 그냥 0이 없어진 형태로 값이 나옴
-- 그냥 mysql에서는 무조건 year(), month(), day() hour(), minute(), second()로 쓰자 09형태등이 필요할 때만 date_format으로 하고

-- https://happycgi.com/community/bbs_detail.php?bbs_num=43&id=&tb=board_man_story

select hour(datetime) as hour, count(*) as count
from animal_outs
where hour(datetime) between 9 and 19
group by hour 
order by hour asc