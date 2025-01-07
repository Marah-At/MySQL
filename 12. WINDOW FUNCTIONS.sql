-- Window Functions " allow us to look at a partition or a group 
-- but each keep their own unique rows in the output ( Row numbers, Rank, Dense Rank)

-- we'll compare the group by & window functions

SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id
GROUP BY gender;


SELECT gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;

-- if we need more details: 

SELECT dem.first_name, dem.last_name, gender, AVG(salary) AS avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name, dem.last_name, gender;
   
   
SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;

-- Another example: we use SUM(salary) ... rolling total : super cool can be done within MySQL,
-- a rolling total is going to start at specific value and add on values from subsequent rows based off of your partition 
-- so all we have to do is add an order by 

SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS rollong_total
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;
   

-- Row_number -- Unique values

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER()
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;
    
-- Row_number with PARTITION BY

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;
   
-- rank these based of the highest salary first down to lowest salary 
-- ROW_NUMBER() : is just not going to have duplicate it's going to give it its own unique within that partition :1, 2, 3, 4, 5, 6, 7 
-- RANK() : rank is going to give the next number positionally not numerically : 1, 2, 3, 4, 5, 5, "7"
-- DENSE_RANK() : dense_rank is going to give the next number numerically not positionally : 1, 2, 3, 4, 5, 5, "6"

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;