select a.rest_id, a.rest_name, a.food_type, a.favorites, a.address, b.score
from rest_info a , 
(SELECT rest_id, round(avg(review_score),2) as score -- 소수점 세번째에서 반올림해라 == 소수점 두번째까지만 나타내라
from rest_review
group by rest_id) b
where a.rest_id = b.rest_id
and a.address like '서울%' --서울로 시작하기 때문에 %서울% 이 아니라 서울%이어야 함. 서울이나 경기도 사는 사람 찾을 때 주의(서울%, 경기도%)
order by score desc, favorites desc