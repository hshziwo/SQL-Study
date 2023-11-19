-- 내 풀이
-- food_type별 최고값들을 찾아서 조인 시켰는데 더 좋은 방법이 있을 거 같다.
select a.food_type, a.rest_id, a.rest_name, a.favorites
from rest_info a join 
(
SELECT food_type, max(favorites) as favorites
from rest_info
group by food_type
) b 
on a.food_type = b.food_type and a.favorites = b.favorites
order by food_type desc

-- 다른 정답인데 내꺼가 더 명확한 듯
-- 여기선 where로 풀었네
SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
FROM REST_INFO
WHERE (FOOD_TYPE, FAVORITES) IN (
    SELECT FOOD_TYPE, MAX(FAVORITES)
    FROM REST_INFO
    GROUP BY FOOD_TYPE
)
ORDER BY FOOD_TYPE DESC;