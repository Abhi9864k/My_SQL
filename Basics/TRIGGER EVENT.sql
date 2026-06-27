select *
from employee_demographics;

select *
from employee_salary;



DELIMITER $$
CREATE TRIGGER add_emp_demo
AFTER INSERT ON employee_salary
FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics(employee_id , first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary( employee_id, first_name, last_name , occupation, salary , dept_id)
VALUES( '13', 'abhishek', 'singh' , 'ai engineer', '5000000' ,'14');

select *
from employee_demographics;

DELIMITER $$
CREATE EVENT employee_retire
ON SCHEDULE EVERY 30 SECOND
DO

BEGIN 
	DELETE
    from employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'event%';






    
