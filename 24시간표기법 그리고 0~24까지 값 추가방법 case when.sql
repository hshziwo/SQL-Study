-- SELECT LEVEL FROM DUAL CONNECT BY LEVEL 문법 모름
-- https://blog.naver.com/PostView.naver?blogId=harrison1995&logNo=222811012887&parentCategoryNo=&categoryNo=28&viewDate=&isShowPopularPosts=false&from=postView
-- 24시간으로 표기는 hh24 임 꼭 기억!
-- 그리고 여기서는 0~24시간 있는 표에 left join을 한거임
-- 없어도 null값 넣을려고
select a.hour, 
(case 
when count is null then 0
else count
end) as count
from
(
select level-1 as hour
from dual
connect by level < 25
) a left join
(
select to_char(datetime, 'hh24') as hour, count(*) as count
from animal_outs
group by to_char(datetime, 'hh24')
) b
on a.hour = b.hour
order by a.hour

-- 중요
-- select level-1
-- from dual
-- connect by level < 25
-- 'hh24'

-- case
-- when ~ then ~
-- when ~ then ~
-- else ~
-- end as 별명