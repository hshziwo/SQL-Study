-- 그냥 || 사용!!!!!

select ('/home/grep/src/'||BOARD_ID||'/'||FILE_ID||FILE_NAME||FILE_EXT) as file_path
from USED_GOODS_FILE
where board_id =
(
select *
from
(
SELECT board_id
from USED_GOODS_BOARD
order by views desc
)
where rownum = 1
)
order by file_id desc