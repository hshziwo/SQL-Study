-- d라내느 case when으로 새로운 컬럼값을 넣는 방법
-- when 이면 then 이거 이런 방식 마지막에 end를 꼭 붙여야 끝남
-- SELECT car_id, 
-- case when to_date('2022-10-16', 'yyyy-mm-dd') between start_date and end_date then '대여중' 
--     when to_char(end_date, 'yyyy-mm-dd') = '2022-10-16' then '대여중'
--     else '대여 가능'
-- end as availability -- end 중요
-- from car_rental_company_rental_history
-- order by car_id desc

-- https://joke00.tistory.com/103
-- CASE
-- WHEN 조건
-- THEN ‘반환 값’
-- WHEN 조건
-- THEN ‘반환 값’
-- ELSE ‘WHEN 조건에 해당 안되는 경우 반환 값’
-- END

-- 아래는 값들로 구분한 select를 union all한 방식인데 통과는 했는데 맞는 지 잘 모르겠네...
select car_id, '대여 가능' as availability
from car_rental_company_rental_history
where car_id not in (select car_id
from car_rental_company_rental_history
where to_date('2022-10-16', 'yyyy-mm-dd') between start_date and end_date
group by car_id)
group by car_id
union all
select car_id, '대여중' as availability
from car_rental_company_rental_history
where to_date('2022-10-16', 'yyyy-mm-dd') between start_date and end_date
group by car_id
order by car_id desc