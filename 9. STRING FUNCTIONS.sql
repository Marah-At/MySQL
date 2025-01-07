-- String Functions ( LENGTH, UPPER, LOWER, TRIM, LTRIM, RTRIM, LEFT, RIGHT, SUBSTRING, REPLACE, LOCATE, CONCAT)

SELECT LENGTH('Marah');

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2;


SELECT UPPER('marah');
SELECT LOWER('MARAH');

SELECT first_name, UPPER(first_name)
FROM employee_demographics;


SELECT ('    Marah  ');
SELECT TRIM('    Marah  ');
SELECT LTRIM('    Marah  ');
SELECT RTRIM('    Marah  ');


SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name, 3, 2),
birth_date,
SUBSTRING(birth_date, 6, 2) AS birth_month
FROM employee_demographics;


SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics;


SELECT LOCATE('r','Marah');

SELECT first_name, LOCATE('An',first_name)
FROM employee_demographics;


SELECT first_name,
last_name, 
CONCAT(first_name,' ', last_name) AS full_name
FROM employee_demographics;

