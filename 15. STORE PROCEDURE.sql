-- Stored Procedures
-- St Procedures are away to save your SQL code that you can reuse over and over again , 
-- when you save it , you can call the store procedure and it's going to execute all the code that you wrote within your st procedure 

SELECT * 
FROM employee_salary
WHERE salary >= 50000;

CREATE PROCEDURE large_salaries()
SELECT * 
FROM employee_salary
WHERE salary >= 50000;

CALL large_salaries();

DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT * 
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT * 
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries3();


-- Parameters : are variables that are passed as an input into a store procedure and allow the store procedure 
-- to accept an input value and placed it into the code 

DROP procedure IF EXISTS `large_salaries4`;
DELIMITER $$
CREATE PROCEDURE large_salaries4(p_employee_id INT)
BEGIN
	SELECT salary
	FROM employee_salary
	WHERE employee_id = p_employee_id 
    ;
END $$
DELIMITER ;

CALL large_salaries4(10);




