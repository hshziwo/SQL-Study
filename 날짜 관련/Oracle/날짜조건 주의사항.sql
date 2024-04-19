-- 날짜 조건 쓸때 2022-08 ~ 2022-10 까지 내역 찾아라고 하면
-- between 조건을 2022-11월까지 줘야 정확한 정답이 됨
-- to_char 비교로 더 깔끔하게 하는 방법 밑에 있음
-- where to_char(start_date,'yyyymm')>='202208'
--   and to_char(start_date,'yyyymm')<='202210'
-- to_char로 yyyymm으로 바꿔서 크기 비교하면 2022-08 ~ 2022-10 까지 내역 만족
select to_number(to_char(start_date, 'mm')) as month, car_id, count(*) records
from CAR_RENTAL_COMPANY_RENTAL_HISTORY
where start_date between to_date('2022-08', 'yyyy-mm') and to_date('2022-11', 'yyyy-mm')
and car_id in
(
select car_id
from CAR_RENTAL_COMPANY_RENTAL_HISTORY
where start_date between to_date('2022-08', 'yyyy-mm') and to_date('2022-11', 'yyyy-mm')
group by car_id
having count(*) >= 5
)
group by to_char(start_date, 'mm'), car_id
having count(*) > 0
order by month asc, car_id desc

-- 이 방법으로 to_char로 숫자형태로 바꿔서 하면 위에 고민 필요없이 정답될듯하네
select to_number(month) as month,car_id,records from (
select to_char(a.start_date,'mm') as month
     , a.car_id
     , count(*) as records
from car_rental_company_rental_history a,(
    --5회이상인 car_id 추출
    select car_id from car_rental_company_rental_history
    where to_char(start_date,'yyyymm')>='202208'
      and to_char(start_date,'yyyymm')<='202210'
      group by car_id
      having count(*) >=5
    ) b
where a.car_id = b.car_id
  and to_char(a.start_date,'yyyymm')>='202208'
  and to_char(a.start_date,'yyyymm')<='202210'

group by to_char(a.start_date,'mm')
     , a.car_id
having count(*) > 0
    )
order by month,car_id desc
