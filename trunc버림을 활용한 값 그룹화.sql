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