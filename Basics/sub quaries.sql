-- subquary

select *
from employee_demographics
where employee_id in (select employee_id
						from employee_salary
						where dept_id = 1)
;

select first_name, last_name,
(select avg(salary)
from employee_salary)
from employee_demographics
;

select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender
; 

select avg(max_age)
from(select gender, avg(age), max(age) as max_age, min(age), count(age)
from employee_demographics
group by gender) as agg_table

;