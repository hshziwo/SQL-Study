-- 주소 || 으로 합치는데 중간에 ' ' 공백을 넣어줘서 주소 모양 나오게 하기 결과는
-- 성남시 분당구 정자일로 210 4동 501호 이런 모양됨
-- (city||' '|| STREET_ADDRESS1 ||' '|| STREET_ADDRESS2) as "전체주소"

-- 전화번호는 substr로 자르고 ||으로 중간에 '-' 넣어서 붙이기 결과는
-- https://siadaddy-cordinglife.tistory.com/5
-- 010-2203-9488 이렇게 됨
-- (substr(tlno,1,3)||'-'||substr(tlno,4,4)||'-'||substr(tlno,8)) as "전화번호"
-- 끝에는 마지막까지 가져올 거라 3번째인수 없음

-- substr 주의할 점은 3번째인수는 몇자리 2번째 인수부터 몇자리 얻어올것인지 하는 것
-- 즉 substr(tlno,4,4)는 4번째자리부터 4개만 얻어와라는 뜻 헷갈리면 안됨

select user_id, nickname, (city||' '|| STREET_ADDRESS1 ||' '|| STREET_ADDRESS2) as "전체주소", (substr(tlno,1,3)||'-'||substr(tlno,4,4)||'-'||substr(tlno,8)) as "전화번호"
from USED_GOODS_USER
where user_id in
(
SELECT writer_id
from USED_GOODS_BOARD
group by writer_id
having count(*) >= 3
)
order by user_id desc