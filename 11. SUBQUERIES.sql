-- Subqueries  " Query within another query "

-- In WHERE Clause
-- We want to to select the employees who worked in the actual parks department 

SELECT *
FROM employee_demographics
WHERE employee_id IN
				( SELECT employee_id
                  FROM employee_salary
                  WHERE dept_id = 1
) ;


-- In SELECT Statement

SELECT first_name, salary,
(SELECT AVG(salary)
FROM employee_salary) AS avg_salary
FROM employee_salary
GROUP BY first_name, salary;


SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

SELECT AVG(max_age)
FROM
(SELECT gender, 
AVG(age) AS avg_age, 
MAX(age) AS max_age, 
MIN(age) AS min_age, 
COUNT(age) AS count_age 
FROM employee_demographics 
GROUP BY gender) AS Agg_table; 