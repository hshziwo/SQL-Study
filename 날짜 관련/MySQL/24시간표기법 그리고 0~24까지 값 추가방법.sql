-- https://velog.io/@ljs7463/MySQL-%EC%9E%85%EC%96%91-%EC%8B%9C%EA%B0%81-%EA%B5%AC%ED%95%98%EA%B8%B02

-- 먼저 생각할것은 현재 우리의 문제가 데이터베이스에는 없는 시간까지해서 0부터 23시까지를 만들어야하는것이다.
-- 따라서, 0부터 23시까지의 테이블을 먼저 만들어 주어야한다.
-- 위의 코드는 SET함수를 사용한 방법으로 0~23까지의 테이블이 완성된다.
-- 코드해석은 다음과같다. SET함수의 경우 어떠한 변수에 특정한 값을 넣어줄 때 사용한다.
-- @는 변수명 앞에 넣어주어야 한다. 즉, @HOUR = -1이라는 것은 HOUR변수에 -1을 넣어준다는 뜻이다.
-- 다음으로 := 기호는 대입해주다는 뜻이다. 즉 HOUR변수에 HOUR +1을 대입해준다는 뜻이다.
-- 즉, 기존 HOUR변수는 -1인데 그 HOUR변수를 +1로 대입해준다는 뜻으로 0이되고 또 0이 +1로 대입되어 1이 되면서 WHERE절인 23미만일때까지 대입되어 HOUR이 22 가 될때 멈추며 22는 22+1 인 23이 된다.
-- 이렇게 하면 0부터 23까지의 테이블이 완성이 되는것이다.
-- 다음으로 해결할 것은 COUNT한 테이블을 만들어주는것이다.
-- HOUR변수와 시간이 같을때를 카운트 하기때문에 HOUR(DATETIME)과 HOUR변수 테이블이 같이 진행되며 COUNT를 시킨다.

SET @HOUR := -1; -- 변수선언

SELECT (@HOUR := @HOUR +1) AS HOUR,
(SELECT COUNT(*) FROM ANIMAL_OUTS WHERE HOUR(DATETIME) = @HOUR) AS COUNT 
FROM ANIMAL_OUTS
WHERE @HOUR < 23