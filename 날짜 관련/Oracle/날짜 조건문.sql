SELECT count(*)
from user_info
where joined between to_date('2021-01-01', 'YYYY-MM-DD') and to_date('2021-12-31', 'YYYY-MM-DD')
and age between 20 and 29