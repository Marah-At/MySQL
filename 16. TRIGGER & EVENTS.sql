-- Trigger & Events 
-- trigger : is a block of code that executes automatically when an event takes place on a specific table 

SELECT *
FROM employee_demographics;

SELECT * 
FROM employee_salary;


-- Use Case : trigger when data is updated into the salary it's going to also update in the employee_demographics table 

DELIMITER $$ 
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;   -- "new" we're talking about the events that takes place this is the data being inserted 

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, 'Jean-Ralphio', 'Saperstein', 'Exntertainment 720 CEO', 1000000, NULL);


-- EVENTS 
/* events is kind of similar to a trigger,
a "trigger" happens when an event takes place 
whereas "event "takes place when it's scheduled( ex1: you're importing data you can pull data from a specific file path an a schedule,
ex2 : you can build reports that are exported to a file on a schedule ... daily or weekly or monthly ... ect )*/

/* Use Case : we need to save some money especially in the parks & work department ... 
   so we want to do retire peolpe who are over the age of 60 immediately and give them  lifetime pay 
   so we want to do create an event checks it let's say every month or every day and then if there're over a specific age we are 
   then delete them from the table and they will be retired */
   
SELECT *
FROM employee_demographics;

DELIMITER $$ 
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND 
DO
BEGIN
	DELETE
	FROM employee_demographics
    WHERE age >= 60 ;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'event%';