-- https://devit.koreacreatorfesta.com/entry/MYSQL-%EC%BF%BC%EB%A6%AC%EB%AC%B8%EC%97%90%EC%84%9C-NULL-%EA%B0%92-%EC%B2%B4%ED%81%AC-%EB%B0%8F-%EA%B0%92-%EB%B3%80%EA%B2%BD
SELECT pt_name, pt_no, gend_cd, age, ifnull(tlno,'NONE') as tlno
from patient
where age <= 12
and gend_cd = 'W'
order by age desc, pt_name asc