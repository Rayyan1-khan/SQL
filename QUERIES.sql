CREATE DATABASE EMPLOYEE;
USE EMPLOYEE;
SHOW databases;

drop database employee;

CREATE TABLE employeeInfo(
	 ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	 Emp_name varchar(30) NOT NULL,
	 Address  varchar(255) NOT NULL,
	 City     varchar(50) NOT NULL,
	 Age      int (30) NOT NULL,
	 DOJ      date  NOT NULL,
	 Designation  varchar(50) NOT NULL,
	 Salary  decimal(15,2) NOT NULL,
	 Mobile  varchar(10) NOT NULL
);

SELECT * FROM employeeInfo;

ALTER TABLE employeeInfo
ADD Email varchar(30);

ALTER TABLE employeeInfo
DROP Email;

DROP TABLE employeeInfo;

INSERT INTO employeeInfo(Emp_name,Address,City,Age,DOJ,Designation,Salary,Mobile)
value   ('Adil','Africa','Mumbai',25,'2022-1-10','Developer',20000.00,'0099887788');

INSERT INTO employeeInfo(Emp_name,Address,City,Age,DOJ,Designation,Salary,Mobile)
value   ('Ambani','Africa','Mumbai',25,'2022-1-10','Developer',20000.00,'0099887788');

INSERT INTO employeeInfo(Emp_name,Address,City,Age,DOJ,Designation,Salary,Mobile)
value   ('chengiz','Turkey','istanbul',29,'2022-11-10','Programer',18000.00,'0099887788');

INSERT INTO employeeInfo(Emp_name,Address,City,Age,DOJ,Designation,Salary,Mobile)
value   ('Tata','Russia','Delhi',47,'2022-2-10','Business',17000.00,'0099887788');

INSERT INTO employeeInfo(Emp_name,Address,City,Age,DOJ,Designation,Salary,Mobile)
value   ('Billi','China','Delhi',54,'2022-4-10','Shopkeeper',30000.00,'0099887788');


SELECT ID ,Emp_name,Age,City,salary FROM employeeInfo;

SELECT Emp_name,age,city
FROM employeeInfo
WHERE salary =20000;

UPDATE employeeinfo
SET Emp_name ='jeff-bezos'
WHERE ID =3;

UPDATE employeeinfo
SET salary ='40000'
WHERE Id =3;

DELETE FROM employeeInfo
WHERE id =7;

SELECT id,Emp_name
FROM employeeInfo
WHERE designation ='programer' AND age > 18;
 
SELECT id,Emp_name
FROM employeeInfo
WHERE designation ='developer' AND salary = '20000' AND age > 20;

SELECT id,Emp_name
FROM employeeInfo
WHERE designation ='progr' OR age > 18;
 
SELECT id,Emp_name
FROM employeeInfo
WHERE designation ='developer' OR salary = '2000';


SELECT id,Emp_name
FROM employeeInfo
WHERE NOT age = 22;
 
SELECT id,Emp_name
FROM employeeInfo
WHERE NOT city ='bhopal';

SELECT id,Emp_name
FROM employeeInfo
WHERE city LIKE 'b%';

SELECT id,Emp_name
FROM employeeInfo
WHERE city LIKE '%l';

SELECT id,Emp_name
FROM employeeInfo
WHERE Mobile LIKE '__9%';

SELECT id,Emp_name
FROM employeeInfo
WHERE city NOT LIKE 'b%';

SELECT * FROM employeeInfo
WHERE city  IN ('bhopal','istanbul');

SELECT * FROM employeeInfo
WHERE city NOT IN ('bhopal','istanbul');

SELECT * FROM employeeInfo
WHERE salary BETWEEN 20000 AND 30000;

SELECT * FROM employeeInfo
WHERE ID BETWEEN 2 AND 5;

SELECT * FROM employeeInfo
ORDER BY emp_name,salary;

SELECT * FROM employeeInfo
ORDER BY emp_name DESC;

SELECT COUNT(EMP_NAME) FROM employeeInfo;
SELECT SUM(salary) FROM employeeInfo;
SELECT AVG(salary) FROM employeeInfo;

SELECT emp_name, min(salary) as lowestsalary FROM employeeInfo;
SELECT emp_name, max(salary) as maxsalary FROM employeeInfo;

SELECT count(designation) , sum(salary), Designation
FROM employeeinfo
GROUP BY Designation;

CREATE TABLE employeeInfoBackup(
	 ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	 Emp_name varchar(30) NOT NULL,
	 Address  varchar(255) NOT NULL,
	 City     varchar(50) NOT NULL,
	 Age      int (30) NOT NULL,
	 DOJ      date  NOT NULL,
	 Designation  varchar(50) NOT NULL,
	 Salary  decimal(15,2) NOT NULL,
	 Mobile  varchar(10) NOT NULL
);
SELECT * FROM employeeInfoBackup;

INSERT INTO employeeInfoBackup
SELECT * FROM employeeInfo;

TRUNCATE TABLE employeeInfoBackup;
DROP TABLE employeeInfoBackup;

#  ----------------SQL JOINS ------------------------------------
#1-INNER JOIN

CREATE DATABASE company;

show databases;

USE company;

CREATE TABLE customer
(
	CustomerId int primary key,
    CustomerName varchar(20),
    City varchar(20)
); 

SELECT * FROM customer;

DELETE FROM customer
where customerid between 102 AND 110;

INSERT INTO customer VALUES(101,'ASHISH','BHOPAL');
INSERT INTO customer VALUES(102,'AJAY','DELHI');
INSERT INTO customer VALUES(103,'BHUPENDRA','MUMBAI');
INSERT INTO customer VALUES(104,'CHOTU','BHOPAL');
INSERT INTO customer VALUES(105,'DINESH','DELHI');
INSERT INTO customer VALUES(106,'RAJU','JAIPUR');
INSERT INTO customer VALUES(107,'ATUL','KOLKATA');
INSERT INTO customer VALUES(108,'VINITA','MYSUR');
INSERT INTO customer VALUES(109,'PINKY','NAINITAL');
INSERT INTO customer VALUES(110,'VIKKY','BHOPAL');

INSERT INTO customer(customerName,city) VALUES('Rayyan','bhopal');


CREATE TABLE orders(
	orderId  int,
    customerId int primary key,
    orderDate date
);

SELECT *FROM orders;

INSERT INTO orders VALUES(1,101,'2022-10-23');
INSERT INTO orders VALUES(2,102,'2021-01-21');
INSERT INTO orders VALUES(3,103,'2020-11-22');
INSERT INTO orders VALUES(4,104,'2000-09-25');
INSERT INTO orders VALUES(5,105,'2019-12-26');
INSERT INTO orders VALUES(6,106,'2016-11-29');
INSERT INTO orders VALUES(7,107,'2014-04-12');
INSERT INTO orders VALUES(8,108,'2021-01-11');
INSERT INTO orders VALUES(9,109,'2020-11-22');
INSERT INTO orders VALUES(10,110,'2010-10-03');

INSERT INTO orders VALUES(11,111,'2012-10-03');



SELECT orders.orderId ,customer.customerName , orders.orderDate ,customer.city
FROM orders
INNER JOIN customer ON customer.customerId = orders.customerId;

SELECT customer.customerName , orders.orderDate
FROM orders
INNER JOIN customer ON customer.customerId = orders.customerId;

# 	========== CONSTRAINT = PRITIBANDH;
# NOT NULL CONSTRAINT;

CREATE DATABASE ConstraintsExample;
USE ConstraintsExample;

CREATE TABLE notNUllExample(
EmpName varchar(30) NOT NULL,
age int NOT NULL,
mobile varchar(30) NOT NULL
);

select * from notNUllExample;

INSERT INTO notNUllExample(EmpName,age,mobile) VALUES('AMITRAI',27,'99998221');
INSERT INTO notNUllExample(EmpName,age,mobile) VALUES('ANCHAL',89,'99998221');
INSERT INTO notNUllExample(EmpName,age,mobile) VALUES('SONU',28,'99998221');
INSERT INTO notNUllExample(AGE) VALUES(23);
INSERT INTO notNUllExample(EmpName,age) VALUES('SONU',28);

DELETE FROM notNullExample WHERE EmpName ='AMITRAI';
DELETE FROM notNUllExample;
truncate table notNUllExample;


DROP TABLE notNUllExample;

# DEFAULT CONSTRAINTS;

CREATE TABLE defaultExample(
EmpName varchar(30) NOT NULL,
age int NOT NULL,
mobile varchar(30) default 'mobile no does\'nt exist'
);

select * from defaultExample;

INSERT INTO defaultExample(EMPNAME,AGE,MOBILE) VALUES('ROHAN',22,'980777655');
INSERT INTO defaultExample(EMPNAME,AGE) VALUES('ROHIT',23);

# CHECK CONSTRAINTS;

CREATE TABLE checkExample(
EmpName varchar(30) NOT NULL,
age int, check(age >= 18),
mobile varchar(30) default 'mobile no does\'nt exist'
);

drop table checkExample;
truncate table checkExample;

select * from checkExample;

INSERT INTO checkExample(EMPNAME,AGE,MOBILE) VALUES('ROHAN',22,'980777655');
INSERT INTO checkExample(EMPNAME,AGE,MOBILE) VALUES('ROhitsharma',32,'990977655');
INSERT INTO checkExample(EMPNAME,AGE) VALUES('Ramu',27);

# UNIQUE CONSTRAINTS;

CREATE TABLE uniqueExample(
EmpName varchar(30) UNIQUE NOT NULL,
age int UNIQUE ,
mobile varchar(30) UNIQUE
);

drop table uniqueExample;
truncate table uniqueExample;

select * from uniqueExample;

INSERT INTO uniqueExample(EMPNAME,AGE,MOBILE) VALUES('ABAAN',22,'980777655');
INSERT INTO uniqueExample(EMPNAME,AGE,MOBILE) VALUES('KAMIL',32,'990977655');
INSERT INTO uniqueExample(EMPNAME,AGE) VALUES('Ramu',27);
INSERT INTO uniqueExample(EMPNAME,AGE,MOBILE) VALUES('RAFI',32,'990977655');




