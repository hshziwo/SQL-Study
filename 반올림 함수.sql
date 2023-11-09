-- 소수 첫 번째 자리에서 반올림하고 -> 소수점 없애란 소리 -> round 0부터 보여라
-- 소수 한자리만 남기고 -> round 1 으로 설정
-- 즉, round는 보일 자리를 설정하는 거임
SELECT round(avg(daily_fee), 0) average_fee
from car_rental_company_car
where car_type = 'SUV'