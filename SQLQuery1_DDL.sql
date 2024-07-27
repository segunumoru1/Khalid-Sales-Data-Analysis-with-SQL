-- Data Definition Language (DDL)
-- RDBMS: Relational Database Management System (MS SQL Server, PostgreSQL Server, MysQL Server, Oracle DB, etc.)

SELECT Top 3 FirstName, LastName, Id
FROM Customer;

SELECT FirstName, LastName, Id
FROM Customer
LIMIT 3;


-- Advantages:
--1. Data Organization
--2. Data Consistency
--3. Data Security
--4. Data Integrity
--5. Data Recovery
--6. Reporting and Analysis
--7. Cost effective
--8. Scalable

-- CREATING A DATABASE
-- CREATE DATABASE ....

-- Common examples of DDL statements are; CREATE, ALTER, INSERT, DROP, UPDATE, DELETE, etc.

-- Data Types:
-- CHAR(size): A fixed length string. 
-- VARCHAR(size): A variable length string.
-- NUMBER(size): The number with precision and scale. The precision is between 1 and 38.
-- INTEGER: Whole numbers
-- BOOLEAN: 0 is FALSE, 1 is TRUE
-- DATE: Year, Month, Day, Hour, Minutes, Seconds, and a fraction of seconds
-- TIMESTAMP: YYYY-MM-DD hh:mm:ss, DD-MM-YYYY hh:mm:ss

-- CONSTRAINTS: They are rules used in databases to enfornce limitations on data stored in a table. They help to maintain data integrity and consistency.

--1. PRIMARY KEY Constraint: It is a key that uniquely identifies each record in a table. It cannot be null values, and they are used to establish
-- and enforce relationships between tables in RDBMS.

-- CREATE TABLE Student (
	student_id INT PRIMARY KEY, student_name VARCHAR(20), dateofbirth DATE);

-- ALTER TABLE Student
ADD CONSTRAINT PK_student PRIMARY KEY (student_id);

--2. FOREIGN KEY Constraint: it is a field in one table that refers to the PRIMARY key in another.

-- CREATE TABLE Student (
	student_id INT PRIMARY KEY, student_name VARCHAR(20), dateofbirth DATE,
	CONSTRAINT const_i FOREIGN KEY (identity_id) REFERENCES Identity (identity_id));

-- ALTER TABLE Student
ADD CONSTRAINT const_i FOREIGN KEY (identity_id) REFERENCES Identity (identity_id)

-- CHECK Constraint: it is used to ensure that data in a column meet certain conditions, such as being within a certain range, or having a 
-- specific format.

-- CREATE TABLE Person (
	ID INT PRIMARY KEY, LastName VARCHAR(50), FirstName VARCHAR(50), Age INT CHECK (Age >= 18) );

-- ALTER TABLE Person
ADD CONSTRAINT CHK_PersonAge CHECK (Age >= 18);


-- DEFAULT CONSTRAINT: It is used to ensure that every new row in the table has a value for a specific column, even if the value is not provided for 
-- in the INSERT statement.  If a value for the column is specified, then it will be used instead of the default value.

-- CREATE TABLE Person (
	ID INT PRIMARY KEY, LastName VARCHAR(50), FirstName VARCHAR(50), Age INT CHECK (Age >= 18),
	City VARCHAR(50) DEFAULT 'Los Angeles');

ALTER TABLE Person
ALTER CITY SET DEFAULT 'Los Angeles';

-- NOT NULL Constraint: It specifies that the column must always have a value, and that a null value cannot be inserted or updated.

-- CREATE TABLE Person (
	ID INT PRIMARY KEY, LastName VARCHAR(50), FirstName VARCHAR(50) NOT NULL, Age INT CHECK (Age >= 18),
	City VARCHAR(50) DEFAULT 'Los Angeles');

ALTER TABLE Person
ALTER COLUMN LastName VARCHAR (50) NOT NULL;


-- We are three tables: customer, product, and orders.

CREATE DATABASE Retail;

-- Create Customer table
CREATE TABLE customer(
	customer_id INTEGER PRIMARY KEY, full_name VARCHAR(50) NOT NULL, address VARCHAR(100));

SELECT* 
FROM customer;

-- Create Product Table

CREATE TABLE product(
	product_id INTEGER PRIMARY KEY, product_name VARCHAR(50) NOT NULL,
	unit_price DECIMAL(18,2) CHECK(unit_price > 0) NOT NULL);

SELECT* 
FROM product;

-- Create Orders table:

CREATE TABLE orders(
	order_id INTEGER PRIMARY KEY, customer_id INT, product_id INT, quantity INT NOT NULL, order_date DATE NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (product_id) REFERENCES product(product_id));

SELECT*
FROM orders;


-- INSERTING OF RECORDS
-- syntax

INSERT INTO customer(customer_id, full_name, address)
VALUES
(1, 'James Smith', 'Los Angeles'),
(2, 'James Brown', 'Maryland'),
(3, 'Peter Stone', 'California'),
(4, 'Garry Nevile', 'Kentuchy'),
(5, 'Clapp Gang', 'Ottawa'),
(6, 'Muller Scott', 'Georgia'),
(7, 'Bowen Freedom', 'Mississippi'),
(8, 'Clautage Beans', 'Los Angeles'),
(9, 'Tony Adams', 'Ontario'),
(10, 'Weeds Tune', 'Los Angeles');

SELECT*
FROM customer;


INSERT INTO product(product_id, product_name, unit_price)
VALUES
(1, 'Cookies', 1.25),
(2, 'Candy', 0.55),
(3, 'Biscuit', 2.67),
(4, 'Chocolate', 5.0),
(5, 'Cookies', 0.99),
(6, 'Whiskey', 3.49),
(7, 'Candy', 0.89),
(8, 'Biscuit', 1.98),
(9, 'Soft Drink', 1.24),
(10, 'Wine', 2.99);

SELECT*
FROM product;

-- DROP TABLE
DROP TABLE product;

ALTER TABLE product
ALTER COLUMN unit_price DECIMAL(18, 2) NOT NULL;


-- INSERTS RECORDS FOR THE ORDERS TABLE

INSERT INTO orders(order_id, customer_id, product_id, quantity, order_date)
VALUES
(1, 1, 2, 3, '2024-01-22'),
(2, 2, 3, 5, '2024-01-23'),
(3, 3, 1, 4, '2024-01-24'),
(4, 4, 5, 7, '2024-02-25'),
(5, 5, 4, 6, '2024-02-12'),
(6, 6, 7, 2, '2024-02-10'),
(7, 8, 8, 4, '2024-03-03'),
(8, 7, 6, 3, '2024-03-04'),
(9, 10, 10, 5, '2024-04-06'),
(10, 9, 9, 4, '2024-04-28');

SELECT*
FROM product;

-- How to update records in the tables (product table)

UPDATE product
SET unit_price = '1.25'
WHERE product_id = '1';

UPDATE product
SET unit_price = 1.39
WHERE product_id = 2;

UPDATE product
SET unit_price = 1.45
WHERE product_id = 5;


-- DELETE Records
-- It is used to delete records within a table

DELETE FROM orders
WHERE customer_id = 10;

SELECT*
FROM orders

-- DROP TABLE
DROP TABLE orders;



-- # DML
-- Add syntax
ALTER TABLE customer
ADD date_of_birth DATE, email_address VARCHAR(50);

SELECT*
FROM customer;

-- To populate the customer table
INSERT INTO  customer(customer_id, date_of_birth, full_name, email_address)
VALUES
(1, '1980-01-04', 'Jame Smith', 'jamesmith@gmail.com'),
(2, '1982-02-04', 'Jame Brown', 'jamesbrown@gmail.com'),
(3, '1983-01-24', 'Peter Stone', 'peterstone@gmail.com'),
(4, '1990-01-04', 'Garry Nevile', 'garrynevile@gmail.com'),
(5, '1970-01-04', 'Clapp Gang', 'clappgang@gmail.com'),
(6, '1991-01-04', 'Muller Scott', 'mullerscott@gmail.com'),
(7, '1992-01-04', 'Bowen Freedom', 'bowenfreedom@gmail.com'),
(8, '1990-05-04', 'Clautage Beans', 'clautagebeans@gmail.com'),
(9, '1980-03-14', 'Tony Adams', 'tonyadams@gmail.com'),
(10, '1994-08-04', 'Weeds Tune', 'weedstune@gmail.com');


UPDATE customer
SET date_of_birth = '1980-01-04', email_address = 'jamesmith@gmail.com'
WHERE customer_id =1;

UPDATE customer
SET date_of_birth = '1982-02-04', email_address = 'jamesbrown@gmail.com'
WHERE customer_id =2;

UPDATE customer
SET date_of_birth = '1982-02-04', email_address = 'jamesbrown@gmail.com'
WHERE customer_id =2;

UPDATE customer
SET date_of_birth = '1983-01-24', email_address = 'peterstone@gmail.com'
WHERE customer_id =3;

UPDATE customer
SET date_of_birth = '1990-01-04', email_address = 'garrynevile@gmail.com'
WHERE customer_id =4;

UPDATE customer
SET date_of_birth = '1970-01-04', email_address = 'clappgang@gmail.com'
WHERE customer_id =5;

-- Rename syntax
SELECT*
FROM customer;


-- Objective

--In this exercise, we will continue building on top of the previous work' deliverables. 
-- The objective of this exercise is to practice the SQL DML queries to insert, update, and delete records.

--Here is the list of records that we are going to use all along the exercise:

--products table:
--Record 1: (name= "Cookies", price= 10)
--Record 2: (name= "Candy", price= 5.2)

--customers table
--Record 1: (name= "Ahmed Gambo", address= "Tunisia")
--Record 2: (name= "Coulibaly Kent", address= "Senegal")
--Record 3: (name= "Hasan Taofiq", address= "Egypt")

--orders table
--Record 1: (costumerid= 11, productid= 12, quantity= 3, order_date= '2023-01-22')
--Record 2: (costumerid= 12, productid= 11, quantity= 10, order_date= '2023-04-14')

--# Instructions
--Write the appropriate SQL queries to insert all the provided records in their corresponding tables.
--Update the quantity of the second order, the new value should be 6.
--Delete the third customer from the customers table.
--Delete the orders table content then drop the table.


-- # DQL
-- 1. Write a query to retrieve the top3 revenue generated by each customer.
--2. Write a query to fetch the total revenue less than $10
--3. write a query to see the average quantity by each product.

SELECT*
FROM product

-- solution
SELECT TOP 3 c.full_name, SUM(p.Unit_price*o.quantity) Total_Rev
FROM Customer c
JOIN [Orders] o
ON c.customer_id = o.customer_Id
JOIN Product p
ON p.product_id = o.product_id
GROUP BY c.full_name
ORDER BY Total_Rev desc;


--- Stored Procedures in SQL: They are precompiled collections of SQL statements and optional control-flow statements that 
-- are stored in the database. They are allow us to encapsulate complex operations and execute them as a single unit.

-- Advantages:
-- Reusability
-- Increase in performance
-- Enhance security
--Transaction management

SELECT*
FROM Customer;

-- Example of stored procedure

--1. Create stored procedure that retrieves supplier details/ customer info based on an supplier id or customerid.

CREATE PROCEDURE GetCustomerByID
	@Id INT
	AS
	BEGIN
		SELECT* FROM Customer
		WHERE Id = @Id;
END;

-- To execute the stored procedure
EXEC GetCustomerByID @Id =1;

-- To drop stored procedure
--syntax
DROP PROCEDURE IF EXISTS
Procedure_Name

DROP PROCEDURE IF EXISTS
GetCustomerByID; 

-- creating a more complex stored procedure

-- Create a stored procedure that inserts a new customer into the customer table.

CREATE PROCEDURE AddCustomer
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@City NVARCHAR(50),
	@Country NVARCHAR(50),
	@Phone NVARCHAR(50)
AS
BEGIN
	INSERT INTO Customer (FirstName, LastName, City, Country, Phone)
	VALUES (@FirstName, @LastName, @City, @Country, @Phone);
END;


-- Execute the insert stored Procedure
-- To add new customer

EXEC AddCustomer @FirstName = 'John', @LastName = 'Dowel', @City = 'Los Angeles', @Country = 'United State of America',
				 @Phone = '234-81452312';

SELECT* 
FROM [Order]


-- To create procedure that retrieve customer orders; orders placed by customer

CREATE PROCEDURE GetCustomerOrders
	@CustomerId INT
AS
BEGIN 
	SELECT o.Id, o.OrderDate, o.TotalAmount
	FROM [Order] o
	WHERE o.CustomerId = @CustomerId;
END;

-- Add new order
CREATE PROCEDURE AddNewOrder
	@CustomerId INT,
	@OrderDate DATETIME,
	@TotalAmount DECIMAL(10, 2)
AS
BEGIN
	DECLARE @Id INT
	INSERT INTO [Order](CustomerId, OrderDate, TotalAmount)
	VALUES (@CustomerId, @OrderDate, @TotalAmount);
	SET @Id = SCOPE_IDENTITY();
END;

