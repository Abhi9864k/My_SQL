SELECT *
FROM parks_and_recreation.employee_demographics;



SELECT first_name,
birth_date,
age,
(age + 20) * 10
FROM parks_and_recreation.employee_demographics;
# PEMDAS 



SELECT distinct gender
FROM parks_and_recreation.employee_demographics;

