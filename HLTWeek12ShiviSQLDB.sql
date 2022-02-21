CREATE DATABASE EMS;
USE EMS;
CREATE TABLE employee_details(emp_no INT NOT NULL  ,
								first_name VARCHAR(20) NOT NULL,
                                last_name VARCHAR(20) ,
                                DOB DATE NOT NULL,
                                phone_no INT ,
                                city VARCHAR(20) NOT NULL ,
                                ADDRESS VARCHAR(70) NOT NULL,
                                gender ENUM('M','F'),
                                martial_status VARCHAR(15) NOT NULL,
                                PRIMARY KEY(emp_no)
                                );

EXPLAIN employee_details;

SELECT * FROM employee_details;   
ALTER TABLE employee_details CHANGE emp_no emp_no INT AUTO_INCREMENT  ;  
INSERT INTO employee_details VALUES('001','ASH','GAUR','1984-06-01','345683349','london','East Street,Surrey','F','married'),                         
								   ('002','JHON','SMITH','1982-06-21','366883329','london','South West Road,Surrey','F','single'),
                                   ('003','PAMELA','KAGAR','1982-03-28','323442259','london','East Bromwitch, Greenwich','M','married'),
									('004','REET','GUR','1970-03-21','323442259','london','Belgrave Road, Leicestershire','F','single'),
									('005','ANNA','PARK','1985-01-28','323442259','london','Temple Road, Birmingham','M','married');
ALTER TABLE employee_details 
CHANGE COLUMN city work_city VARCHAR(15);
SELECT * FROM employee_details 
WHERE DOB > '1982-01-01' AND DOB < '1983-01-01';
INSERT INTO employee_details VALUES( '006','PRIYA','K','1990-03-08','345555660','Birmingham','Queens Road,Dudley','F','');
SELECT * FROM employee_details 
WHERE gender = 'F';


