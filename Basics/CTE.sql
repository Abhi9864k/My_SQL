-- CTE
with CTE_example(GENDER, AVG_SAL, MAX_SAL, MIN_SAL, COUNT_SAL )  as #overwrites the column head 
(
select  gender, avg(salary) avg_sal, max(salary) max_salary , min(salary) min_salary, count(salary) count_salary 
from employee_demographics as dem 
join employee_salary as sal 
on dem.employee_id = sal.employee_id
group by gender

)
select *
from CTE_example;

with CTE_example as
(
select  employee_id, first_name, gender, age
from employee_demographics
where birth_date > '1985-01-01'

),

 CTE_example_2 as
(
select  employee_id, first_name, salary
from employee_salary
where salary > 50000

)
select *
from CTE_example 
join CTE_example_2
	on CTE_example.employee_id = CTE_example_2.employee_id
    
    ;



