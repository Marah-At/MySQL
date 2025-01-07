-- CASE STATEMNET " to add logic in your select statement sort of like an if, else statement 

SELECT first_name,
last_name,
age,
CASE
    WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Old'
    ELSE "On Death's Door"
END AS Age_Bracket
FROM employee_demographics;


-- Use Case : Pay Increase and Bonus 
-- < 50000 ---> 5%
-- > 50000 ---> 7%
-- if they in finance department ---> 10% bonus just cash 

SELECT first_name,
last_name,
salary,
CASE
    WHEN salary <= 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
END AS New_Salary,
CASE
    WHEN dept_id = 6 THEN salary * .10
END AS Bonus
FROM employee_salary;



