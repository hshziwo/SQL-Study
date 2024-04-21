-- TRUNC(컬럼, 자릿수) 숫자제거 : 자릿수만큼 숫자 제거 -4면 아래부터 4자리 0으로 바꿈 --> 자릿수 지정 가능해서 floor 대신 쓸 수 있음
-- 아래에 잘 보면 GROUP BY TRUNC(PRICE,-4) 이렇게 그룹을 만들 수 있게 사용 가능함
-- round(컬럼, 자릿수) 반올림 --> 자릿수 지정 가능
-- floor(숫자) 소수 버림, ceil(숫자) 소수 올림 --> 이건 정수로만 내림 올림이 가능


-- trunc 활용해서 10000으로 나누고 소수 버리고 10000 곱하면 그룹함수 됨.
SELECT (trunc(price/10000) * 10000) as PRICE_GROUP, count(*) as PRODUCTS
from product
group by (trunc(price/10000) * 10000)
order by PRICE_GROUP asc

-- 그냥 마이너스로 곱하기 버리기 안해도 그냥 자릿수로 버려도 됨
SELECT TRUNC(PRICE,-4) AS PRICE_GROUP,COUNT(*) AS PRODUCTS
FROM PRODUCT 
GROUP BY TRUNC(PRICE,-4)
ORDER BY PRICE_GROUP;