-- 대여일을 구할 때, ENDDATE - STARTDATE + 1을 해줘야한다. 대여일에 시작일, 반납일이 포함된다.

-- 날짜 구간을 비교연산자로 비교할 때, 시작일을 >=로 포함해준다.
-- 2019-09-01 00:00:00 < STARTTIME (x)
-- 2019-09-01 00:00:00 <= STARTTIME (o)

-- 날짜를 포멧팅 하여 출력한다.
-- STARTIME => 2019-09-01 00:00:00
-- DATEFORMAT(START_TIME, '%Y-%m-%d') => 2019-09-01

--  (end_date - start_date + 1) >= 30 then '장기 대여'
-- START_DATE와 END_DATE가 동일하다면 0일으로 계산되기 때문에 +1일을 해줌으로써 대여일과 반납일이 동일해도 1일로 잡기 위함입니다.
-- 1.1~1.3까지 빌린거는 3일 CASE WHEN END_DATE - START_DATE 이렇게 계산하면 2로 나오기때문에 +1

SELECT history_id, car_id, to_char(start_date, 'yyyy-mm-dd') as start_date, to_char(end_date, 'yyyy-mm-dd') as end_date,
case
when (end_date - start_date + 1) >= 30 then '장기 대여'
else '단기 대여'
end as rent_type
from CAR_RENTAL_COMPANY_RENTAL_HISTORY
where to_char(start_date, 'yyyymm') = '202209'
order by history_id desc