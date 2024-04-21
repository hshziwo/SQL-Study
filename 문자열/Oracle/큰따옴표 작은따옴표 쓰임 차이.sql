-- 날짜는 작은 따옴표 되고 알리아스는 큰따옴표로 해야되나?
-- 맞네 블로그 확인
-- 컬럼명을 쓸때는 쌍따옴표, 문자열은 홑따옴표 !
-- 대문자 이슈가 있어서 한글일때만 쌍따옴표 써서 쓰는걸로!
-- https://velog.io/@sangzoon0102/Oracle-SQL%EB%AC%B8%EC%9D%98-%EC%8C%8D%EB%94%B0%EC%98%B4%ED%91%9C-%ED%99%91%EB%94%B0%EC%98%B4%ED%91%9C-%EC%A0%95%EB%A6%AC
-- https://codebb.tistory.com/15
SELECT MCDP_CD as "진료과코드", count(*) as "5월예약건수"
from APPOINTMENT
where to_char(APNT_YMD, 'yyyy-mm') = '2022-05'
group by MCDP_CD
order by "5월예약건수" asc, "진료과코드" asc

-- 그냥 order by는 컬럼 숫자로 쓰자
SELECT MCDP_CD as "진료과코드", count(*) as "5월예약건수"
from APPOINTMENT
where to_char(APNT_YMD, 'yyyy-mm') = '2022-05'
group by MCDP_CD
order by 2 asc, 1 asc