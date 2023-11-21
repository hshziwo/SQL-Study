-- 아래에서 기록이 있어서 20221101~20221130 까지 대여 불가한 목록 쿼리는 다음과 같음
-- 시작이 11월 30일까지 있고 종료일이 11월 1일보다 큰 경우
-- 이 경우를 not in으로 빼주면
-- 대여기록 자체가 없어서 가능한 거 + 대여 기록은 있지만 기간이 가능해서 기간 동안 대여 가능한 목록나옴
-- where to_char(start_date, 'yyyymmdd') <= '20221130' and to_char(end_date, 'yyyymmdd') >= '20221101'

-- 11월 1일부터 30일까지 대여 가능한 차를 알아보라는 말은 시작일 1일부터 30일 동안빌리겠다는 말입니다.
-- STARTDATE가 12월1일보다 전에 시작되었거나 ENDDATE가 11월 1일보다 크면
-- 해당 차는 11월 1일부터 30일까지 빌리는게 불가능하겠죠?
-- 다시 말해서 2022년 11월 1일부터 30일까지 어떠한 대여기록도 있으면 안된다는 뜻과 같습니다.


select a.car_id, a.car_type, (30*a.daily_fee*(100-b.discount_rate)/100) fee
from
(
select *
from CAR_RENTAL_COMPANY_CAR
where car_id not in
(
select car_id
from CAR_RENTAL_COMPANY_RENTAL_HISTORY
where to_char(start_date, 'yyyymmdd') <= '20221130' and to_char(end_date, 'yyyymmdd') >= '20221101'
group by car_id
)
and car_type in ('세단', 'SUV')
) a left join
(
SELECT *
from CAR_RENTAL_COMPANY_DISCOUNT_PLAN
where duration_type = '30일 이상'
and car_type in ('세단', 'SUV')
) b
on a.car_type = b.car_type
where (30*a.daily_fee*(100-b.discount_rate)/100) >= 500000 and (30*a.daily_fee*(100-b.discount_rate)/100) < 2000000
order by fee desc, car_type asc, car_id desc