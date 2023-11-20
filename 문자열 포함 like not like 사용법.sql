select animal_id, animal_type, name
from animal_outs
where animal_id in
(
SELECT animal_id
from animal_ins
where sex_upon_intake like '%Intact%'
)
and sex_upon_outcome not like '%Intact%'
order by animal_id asc


-- 아래는 join 쓴 정답이네..
SELECT
    B.ANIMAL_ID, B.ANIMAL_TYPE, B.NAME
FROM
    ANIMAL_INS A
INNER JOIN
    ANIMAL_OUTS B
ON
    A.ANIMAL_ID = B.ANIMAL_ID
WHERE
    A.SEX_UPON_INTAKE  LIKE '%Intact%'
    AND B.SEX_UPON_OUTCOME NOT LIKE '%Intact%'
ORDER BY
    B.ANIMAL_ID;