-- GROUP BY

SELECT *
FROM employee_demographics;


SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
Group by gender;


SELECT occupation, salary
FROM employee_salary
GROUP by occupation, salary;


-- ORDER BY

SELECT *
FROM employee_demographics
ORDER BY gender, age DESC;


SELECT *
FROM employee_demographics
ORDER BY 5, 4;