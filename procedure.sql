-- STORED PROCEDURES

CREATE PROCEDURE emp_sal_1()
select *
from employee_salary
where salary>50000;

CALL emp_sal_1();

DELIMITER $$
CREATE PROCEDURE emp_sal_3()
BEGIN
	select *
	from employee_salary
	where salary>=50000;
	select *
	from employee_salary
	where salary>=10000;
    END $$
DELIMITER ;

CALL emp_sal_3;

-- PARAMETER

DELIMITER $$
CREATE PROCEDURE emp_sal_4(employee_id_ka_id int)
BEGIN
	select salary
	from employee_salary
    where employee_id=employee_id_ka_id;
	
    END $$
DELIMITER ;

call emp_sal_4(1)

