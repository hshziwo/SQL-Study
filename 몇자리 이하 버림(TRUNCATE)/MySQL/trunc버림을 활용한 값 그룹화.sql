-- https://velog.io/@tolerance/TIL-%EC%88%AB%EC%9E%90%ED%95%A8%EC%88%98-ROUND-FLOOR-CEIL-and-TRUNCATE

-- truncate(컬럼, 자릿수) 숫자제거 : 자릿수만큼 숫자 제거 -4면 아래부터 4자리 0으로 바꿈 --> 자릿수 지정 가능해서 floor 대신 쓸 수 있음
-- 아래에 잘 보면 GROUP BY truncate(PRICE,-4) 이렇게 그룹을 만들 수 있게 사용 가능함
-- round(컬럼, 자릿수) 반올림 --> 자릿수 지정 가능
-- floor(숫자) 소수 버림, ceil(숫자) 소수 올림 --> 이건 정수로만 내림 올림이 가능

SELECT truncate(PRICE,-4) AS PRICE_GROUP,COUNT(*) AS PRODUCTS
FROM PRODUCT 
GROUP BY truncate(PRICE,-4)
ORDER BY PRICE_GROUP;