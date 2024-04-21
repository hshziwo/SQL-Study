-- mysql에서는 '' "" 는 상관없고
-- order by 에서 별칭 쓸 때 ''나 ""를 쓰면 안됨 그냥
-- order by 5월예약건수 asc, 진료과코드 asc 이렇게 쓰거나
-- order by 2 asc, 1 asc 이렇게 컬럼 순서로 쓰기
-- 그냥 컬럼 순서로 쓰는 게 나아 보임 오라클도 이렇게 하면 됨

-- https://suminii.tistory.com/entry/MYSQL-%EC%A7%84%EB%A3%8C%EA%B3%BC%EB%B3%84-%EC%B4%9D-%EC%98%88%EC%95%BD-%ED%9A%9F%EC%88%98-%EC%B6%9C%EB%A0%A5%ED%95%98%EA%B8%B0

SELECT MCDP_CD as '진료과코드', count(*) as '5월예약건수'
from APPOINTMENT
where date_format(APNT_YMD, '%Y-%m') = '2022-05'
group by MCDP_CD
order by 2 asc, 1 asc