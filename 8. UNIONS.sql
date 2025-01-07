-- UNIONS " Allows you to combine the rows together from separate tables or from the same table " 

-- UNION = UNION DISTINCT ( Unique Values)
SELECT first_name, last_name
FROM employee_demographics
UNION 
SELECT first_name, last_name
FROM employee_salary;

-- UNION ALL 

SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;


/* Use Case : The parks department is trying to cut their budget a little bit 
so they want to identify older employees that they can push out 
and they also want to identify high paid employees who can reduce 
their pay or push them out to save money */ 

SELECT first_name, last_name, 'Old Man' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION 
SELECT first_name, last_name, 'Highly Paid Employee' AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;