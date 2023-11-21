-- substr 문자열자르기 상품 카테고리 앞에서 두 글자 예시
-- substr(글자, 시작(1부터시작), 종료)
-- 끝까지 자를꺼면 종료 없어도 됨

SELECT substr(product_code,1,2) as category, count(*) as products
from product
group by substr(product_code,1,2)
order by category asc