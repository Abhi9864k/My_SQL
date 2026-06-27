-- select statement

select first_name, last_name, age,
CASE 
	when age < 30 then 'young'
    when age between 30 and 50 then 'old'
    when age >60 then 'very old'
end as age_bracket
from employee_demographics
;


-- PAY INCREASE 
-- <50000 = 5%
-- >50000 = 7%
-- FINANCE bonus = 10%

select first_name, last_name, salary,

case
	when salary < 50000 then salary*1.05
    when salary > 50000 then salary*1.07
end as new_salary,

case 
	when dept_id = 6 then salary*0.1
end as bonus

from employee_salary
;

select *
from parks_departments;

select * 
from employee_salary