-- Temporary Tables 
/* that are only visible to the session that they're created in , 
   and as a data analyst, we used it for storing intermediate results for complex queries somewhat like a CTEs
   but also for using it to manipulate data before I insert it into a more permanent table */
   
CREATE TEMPORARY TABLE temp_table
( first_name VARCHAR(50),
  last_name VARCHAR(50),
  favorite_movie VARCHAR(100)
);
   
SELECT * 
FROM temp_table;

INSERT INTO temp_table
VALUES('Marah', 'Alatwani', 'Lord of the Rings: The two Towers');

SELECT * 
FROM temp_table;

-- Temporary table and fill it with select statement 

SELECT *
FROM employee_salary;

CREATE TEMPORARY TABLE salary_over_50K
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT * 
FROM salary_over_50K;   /*temp tables are they last as long as you are within that session ( work in new window), 
                          but if we're to exit out and come back in then it is no longer going to be working */


/* "Temp tables" this is usually for the more advanced things so we're usually using these in st procedures when really manipulating 
    data and doing a lot more complex queries overall and often times use multiple temp tables and joining them together .
   " CTEs " it's typically more simple things because you can't make as advanced CTE or as complex CTE */



