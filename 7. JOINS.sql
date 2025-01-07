-- JOINS

SELECT * 
FROM employee_demographics;

SELECT * 
FROM employee_salary;


-- INNER JOINS 

SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id;
  
  
/* OUTER JOINS ( Right Join & Left Join):
Right Join :take everything from the Right table and only return the matches in the left table
Left Join :take everything from the left table and only return the matches in the right table */
  
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id;
    

SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id;
    
    
-- SELF JOIN :" where you tie the table to itself "

SELECT emp1.employee_id AS emp_santa,
       emp1.first_name AS first_name_santa,
	   emp1.last_name AS last_name_santa,
       emp2.employee_id AS emp_id,
       emp2.first_name AS emp_first_name,
	   emp2.last_name AS emp_last_name
FROM employee_salary emp1
JOIN employee_salary emp2
    ON emp1.employee_id + 1 = emp2.employee_id ;


-- JOINING MULTIPLE TABELS TOGETHER 

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments pd
	ON sal.dept_id = pd.department_id;
    
    
SELECT * 
FROM parks_departments;    
    

    