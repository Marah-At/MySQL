-- LIMIT & ALIASING

SELECT * 
FROM employee_demographics
LIMIT 3;


SELECT *  -- take the three oldest employees ( order by + limit)
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;


SELECT *  -- Here we are going to start at the position (2) and we're going to go one row after 
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1;


-- ALISING " to change the name of the column "

SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40 ; 
