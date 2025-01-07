-- CTEs : Common Table Expression, They're going to allow you to define a subquery block that you can then reference within the main query
-- the keyword to define the CTE is " WITH " 
-- 
WITH CTE_Example AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id
GROUP BY gender
)    -- the CTE are unique because you can only use the CTE immediately after created 
SELECT AVG(avg_sal)
FROM CTE_Example 
;

WITH CTE_Example (Gender, Avg_Sal, Max_Sal, Min_Sal, Count_Sal)AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id
GROUP BY gender
)   
SELECT *
FROM CTE_Example 
;

/* Error as the table 'parks_and_recreation.cte_example' doesn't exist as you are creating a CTE ,
   you're not creating a permanent object like a temp table or real table ( not saving not storing in memory) */
   
SELECT AVG(avg_sal)
FROM CTE_Example;  


-- Create multiple CTE within just one 

WITH CTE_Example AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics 
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
    ON CTE_Example.employee_id = CTE_Example2.employee_id
;