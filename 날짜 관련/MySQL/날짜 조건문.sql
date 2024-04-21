SELECT count(*)
from user_info
where joined between date_format('2021-01-01', '%Y-%m-%d') and date_format('2021-12-31', '%Y-%m-%d')
and age between 20 and 29

SELECT count(*)
from user_info
where joined >= date_format('2021-01-01', '%Y-%m-%d') and joined <= date_format('2021-12-31', '%Y-%m-%d')
and age between 20 and 29

SELECT count(*)
from user_info
where date_format(joined, '%Y') = 2021
and age between 20 and 29