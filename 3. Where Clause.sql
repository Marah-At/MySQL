-- WHERE Clause

SELECT *
FROM employee_salary
WHERE first_name = 'Ron';


SELECT *
FROM employee_salary
WHERE salary > 50000;


SELECT *
FROM employee_salary
WHERE salary <= 50000;


SELECT *
FROM employee_demographics
WHERE gender = 'Male';


SELECT *
FROM employee_demographics
WHERE gender != 'Male';


SELECT *
FROM employee_demographics
WHERE birth_date > '1987-01-01';


-- Logical Operators ( AND, OR, NOT)

SELECT *
FROM employee_demographics
WHERE birth_date > '1987-01-01' 
AND gender = 'Female';


SELECT *
FROM employee_demographics
WHERE birth_date > '1987-01-01' 
OR gender = 'Female';


SELECT *
FROM employee_demographics
WHERE birth_date > '1987-01-01' 
OR NOT gender = 'Female';


SELECT *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55 ;


-- LIKE Statement
-- % and _

SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%';


SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__';


SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%';


SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1985%';