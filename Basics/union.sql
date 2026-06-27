-- UNION

 select first_name, last_name
 from employee_demographics
 UNION distinct
 select first_name, last_name
 from employee_salary
 ;
 
 select first_name, last_name
 from employee_demographics
 UNION all
 select first_name, last_name
 from employee_salary
 ;
 
 
 select first_name, last_name, 'Old man' as label
 from employee_demographics
 where age > 40 and gender = 'male'
 UNION 
 select first_name, last_name, 'Old lady' as label
 from employee_demographics
 where age > 40 and gender = 'female'
 UNION
 select first_name, last_name, 'Highly paid employee' as label
 from employee_salary
 where salary>70000
 order by first_name, last_name
 ;
 