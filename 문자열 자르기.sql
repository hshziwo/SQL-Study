-- substr 문자열자르기 상품 카테고리 앞에서 두 글자 예시
-- substr(글자, 시작(1부터시작), 몇개가져올것인가)
-- 끝까지 자를꺼면 몇개가져올것인가 없어도 됨
-- substr 주의할 점은 3번째인수는 몇자리 2번째 인수부터 몇자리 얻어올것인지 하는 것
-- 즉 substr(tlno,4,4)는 4번째자리부터 4개만 얻어와라는 뜻 헷갈리면 안됨

SELECT substr(product_code,1,2) as category, count(*) as products
from product
group by substr(product_code,1,2)
order by category asc