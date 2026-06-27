-- TEMPORARY TABLE

CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

SELECT *
FROM temp_table;


INSERT INTO temp_table
VALUES ('abhishek','singh','dhu');

SELECT *
FROM temp_table;

select *
from employee_salary;

CREATE TEMPORARY TABLE salary_over_50k
select *
from employee_salary
where salary >= 50000
;

select *
from salary_over_50k;
