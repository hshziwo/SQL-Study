-- lower로 했을 때로 like 찾으면 됨.

SELECT ANIMAL_ID, NAME
from ANIMAL_INS
where lower(name) like '%el%'
and animal_type = 'Dog'
order by name