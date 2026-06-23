-- limit

select *
from employee_demographics
order by age desc
limit 4

; 

select *
from employee_demographics
order by age desc
limit 2,3

; 

-- Aliasing

select gender, avg(age) as avg_age
from employee_demographics
group by gender
having avg_age>40

;
