USE ems;
CREATE TABLE payroll(
 emp_no int NOT NULL,
 salary int NOT NULL,
 title char(20) ,
 from_date date NOT NULL,
 to_date date NOT NULL,
 PRIMARY KEY (emp_no)
);
INSERT INTO payroll VALUES('1','20000','engineer','1993-03-02','2017-01-21'),
						  ('2','23000','System engineer','1986-05-31','2017-04-12'),
						  ('3','25000','Technician','1997-01-01','2018-08-07'),
						  ('4','30000','Analyst','1986-05-31','2020-06-02'),
						  ('5','20000','engineer','1996-05-01','2017-02-09'),
						  ('6','27000','Sr.engineer','1997-01-01','2017-07-02');
select * from payroll;
select * from employee_details;
ALTER TABLE employee_details CHANGE emp_no emp_no INT AUTO_INCREMENT  ; 


--  View and show both table structures and data to make sure they are setup correctly
EXPLAIN payroll;
EXPLAIN employee_details;

-- Update a record
UPDATE payroll
SET from_date = '1993-02-02'
WHERE emp_no = 1 ;

-- Delete a record
DELETE FROM payroll 
WHERE title = 'Analyst';

--- drop table payroll;

-- Join tables
SELECT employee_details.first_name, employee_details.last_name,  payroll.salary
FROM employee_details
INNER JOIN payroll ON employee_details.emp_no=payroll.emp_no;

-- Run a simple query (one field/column) searching one table.
SELECT emp_no,first_name,DOB,phone_no 
FROM employee_details
WHERE DOB > '1969-01-01'
LIMIT 2;

-- Run a complex query (more than one field/column) to demonstrate the relations between the 2 tables
SELECT emp.*,p.*
FROM 
employee_details emp,
payroll p
ORDER BY emp.emp_no=p.emp_no;

-- Retrieve all your data sorted in ascending order on an appropriate field (one table)
SELECT emp_no,first_name,last_name,work_city
FROM employee_details
ORDER BY DOB ASC;

-- Filter data using comparison operators (one table)

SELECT * FROM payroll
WHERE title = 'engineer';