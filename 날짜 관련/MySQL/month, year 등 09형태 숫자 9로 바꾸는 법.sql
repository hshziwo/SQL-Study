-- mysql에서는 month(), day() year(), hour(), minute(), second() 등의 함수를 쓰면 그냥 0이 없어진 형태로 값이 나옴
-- 그냥 mysql에서는 무조건 year(), month(), day() hour(), minute(), second()로 쓰자 09형태등이 필요할 때만 date_format으로 하고

-- https://happycgi.com/community/bbs_detail.php?bbs_num=43&id=&tb=board_man_story

select month(a.start_date) as month
     , a.car_id
     , count(*) as records
from car_rental_company_rental_history a,(
    -- 5회이상인 car_id 추출
    select car_id from car_rental_company_rental_history
    where date_format(start_date,'%Y%m')>='202208'
      and date_format(start_date,'%Y%m')<='202210'
      group by car_id
      having count(*) >= 5
    ) b
where a.car_id = b.car_id
  and date_format(a.start_date,'%Y%m')>='202208'
  and date_format(a.start_date,'%Y%m')<='202210'
group by date_format(a.start_date,'%m')
     , a.car_id
having count(*) > 0
order by month,car_id desc
