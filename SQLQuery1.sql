SELECT* 
FROM Customer;

SELECT* 
FROM OrderItem;

SELECT*
FROM Product;

SELECT*
FROM Supplier;

SELECT UnitPrice, Quantity, (UnitPrice * Quantity) AS Sales
FROM OrderItem;

-- REmoving Duplicate Records
-- To remove duplicate records, we will use "DISTINCT" keyword after the SELECT statement.

-- Get unique package in Product and how many are they?

SELECT DISTINCT Package
FROM Product;

-- Challenge 1
-- fetch the unique product name from the product table, and how many are they?

SELECT DISTINCT ProductName, Package
FROM Product;


-- Sorting of Records

-- ORDER BY: the order by keyword is what we used to sort records.

-- ASC, DESC # take note

SELECT SupplierId, ProductName
FROM Product
ORDER BY SupplierId DESC;

-- LIMIT OF RECORDS # Top N {1, 2, ...}

SELECT TOP 10 SupplierId, ProductName
FROM Product
ORDER BY SupplierId DESC;

-- Challenge 2
-- Fetch the first 10 package by first sorting in descending order using UnitPrice from Product table.

SELECT TOP 10 Package, UnitPrice
FROM Product
ORDER BY UnitPrice DESC;


-- Filtering of Records
-- We can filter using the WHERE keyword. It works with OPERATORS (>, =, <=, >, !=, AND, OR)

-- fetch the customer info with First name, and Lastname, Phone Number from Mexico, and how many are they?

SELECT FirstName, LastName, Phone
FROM Customer
WHERE Country = 'Mexico';

SELECT* 
FROM Customer;

-- Fetch all the customer info that doesn't hail from Germany

SELECT*
FROM Customer
WHERE Country != 'Germany';


-- Fetch the product, quantity whose UnitPrice is less than 14, and how many are they, sort in using quantity in DESC?

SELECT TOP 10*
FROM OrderItem
WHERE UnitPrice < 14
ORDER BY Quantity DESC;


SELECT* 
FROM OrderItem;

-- Fetch product info where quantity is 120 or UnitPrice is greater than or equals 20, sort in descending order using quantity.

SELECT*
FROM OrderItem
WHERE Quantity = 120 OR UnitPrice >= 20
ORDER BY Quantity DESC;


-- Fetch product info where quantity is 42 and UnitPrice is 14, then sort in descending order to get the top 2, using quantity.

SELECT TOP 2 *
FROM OrderItem
WHERE Quantity = 42
AND
UnitPrice = 14
ORDER BY Quantity desc;


-- Filtering Predicates
-- BETWEEN, NOT BETWEEN, IN, NOT IN


-- Fetch the product, quantity whose UnitPrice is less than 14 and Quantity is between 40 and 200, and how many records are they, sort in using quantity in DESC?

SELECT *
FROM OrderItem
WHERE 
UnitPrice < 14
AND
Quantity BETWEEN 40 AND 200
ORDER BY Quantity desc;



-- Fetch the product info, whose UnitPrice is greater than 14 and Quantity is not between 80 and 200, and how many records are they, sort in using quantity in DESC?

SELECT *
FROM OrderItem
WHERE 
UnitPrice > 14
AND
Quantity NOT BETWEEN 80 AND 120
ORDER BY Quantity desc;


-- IN : it is used to replace multiple equal = sign

SELECT*
FROM Customer;

-- Fetch customer info where FirstName is Maria,  Paula, and Rita, and sort by FirstName in Descending order.

SELECT *
FROM Customer
WHERE Firstname in ('Maria', 'Paula', 'Rita')
ORDER BY firstname desc;


-- Fetch customer info where LasttName is not Cruz,  Dewey, and Kloss, and sort by FirstName in Descending order.

SELECT *
FROM Customer
WHERE LastName NOT IN ('Cruz', 'Dewey', 'Kloss')
ORDER BY FirstName desc;


-- Pattern Filtering
-- LIKE

-- WILDCARDS (%, _)

-- % ==> as many character as possible WHILE _ ===> one character at a time


-- Fetch the firstname, and lastname from customer table where firstname starts with "A"

SELECT firstname, LastName
FROM Customer
WHERE FirstName LIKE 'A%';


-- Fetch the firstname, and lastname from customer table where lastname ends with "no"

SELECT firstname, LastName
FROM Customer
WHERE LastName LIKE '%no';

-- Fecth the firstname, and lastname from customer table where firstname starts with "A" AND/OR lastname ends with "on", and sort in DESC using lastname.

SELECT FirstName, LastName
FROM Customer
WHERE FirstName LIKE 'A%'
OR
LastName LIKE '%on'
ORDER BY LastName desc;


SELECT *
FROM Customer;

SELECT FirstName, LastName
FROM Customer
WHERE FirstName LIKE 'A%'
AND
LastName LIKE '%on'
ORDER BY LastName desc;

-- Underscore (_)

-- Get all info of customers whose firstname starts with "B" and has a total of 5 characters from customer table.

SELECT FirstName, LastName
FROM Customer
WHERE FirstName LIKE 'A____';

-- Fetch all the customer info whose Phonenumber start with "(11)", and has exactly 10 characters

SELECT *
FROM Customer
WHERE Phone LIKE '(11)_________';


-- IS NULL AND IS NOT NULL

SELECT *
FROM Supplier;

-- Fecth suppliers info where Fax is Not Null/Is Null

SELECT *
FROM Supplier
WHERE Fax IS NULL;

SELECT *
FROM Supplier
WHERE Fax IS NOT NULL;

-- Fecth suppliers info where Fax is Is Null and Country is both USA and UK, and sort in descending order using contactname.

SELECT *
FROM Supplier
WHERE Fax IS NULL
AND
Country IN ('USA','UK')
ORDER BY ContactName desc;

-- ISNULL() / COALESCE() ==> if you want to replace the null values with a different value, we can use the ISNULL or COALESCE function.

-- Investigate the null values in Fax, and replace it with "(234) 813-5567" if necessary.

SELECT ISNULL(Fax, '234-813-5567') AS Fax
FROM Supplier;

UPDATE Supplier
SET Fax = ISNULL(Fax, '234-813-5567')
WHERE Fax IS NULL;

SELECT*
FROM Supplier;


-- AGGREGATE FUNCTIONS : it is used for simple statistical operation. They operate on a column or field at a time, and change the column name to themselves.
-- AVG, SUM, MIN, MAX, STDEV, VAR, COUNT

SELECT*
FROM OrderItem;

-- AVG
-- Find the average unitprice of items

SELECT AVG(UnitPrice) Average
FROM OrderItem;


-- FInd the average quantity of items sold

SELECT AVG(Quantity) Average_Qty
FROM OrderItem;


-- SUM
-- Find the total unitprice of items 

SELECT SUM(UnitPrice) Total_Price
FROM OrderItem;

-- Find the total quantity of items sold

SELECT SUM(Quantity) Total_Qty
FROM OrderItem;

-- MIN
-- FInd the minimum unit price of items

SELECT MIN(UnitPrice) Min_UnitPrice
FROM OrderItem;

-- FInd the minimum quantity of items sold

SELECT MIN(Quantity) Min_qty
FROM OrderItem;


-- MAX
-- FInd the maximum unit price of items
SELECT MAX(UnitPrice) Max_UnitPrice
FROM OrderItem;

-- FInd the maximum quantity sold of items

SELECT MAX(Quantity) Max_Qty
FROM OrderItem;

-- STDEV: it is the squared distance of a value from the mean. It is also the square root of variance

-- Find the standard deviation of the unitprice from the OrderItem table

SELECT STDEV(UnitPrice) AS stdev_unitprice
FROM OrderItem;

-- ROUND()


SELECT ROUND(STDEV(UnitPrice), 2) AS stdev_unitprice
FROM OrderItem;

-- VAR
-- Find the variance of the unitprice from the OrderItem table

SELECT VAR(UnitPrice) AS var_unitprice
FROM OrderItem;

SELECT ROUND(VAR(UnitPrice), 0) AS var_unitprice
FROM OrderItem;

-- COUNT(): it returns the frequency of a value in a column

-- Fetch the number of countries we have in customer table

SELECT COUNT(Country) AS coun_country
FROM Customer;

-- What if we want to count the uniques countries
SELECT COUNT(DISTINCT Country) AS coun_country
FROM Customer;

SELECT DISTINCT country
FROM Customer;

SELECT*
FROM Supplier;

SELECT COUNT(ContactTitle) AS no_contact_title
FROM Supplier;

-- COUNT(*)

SELECT COUNT(*) ContactTitle
FROM Supplier;

-- On the same table, fetch the minimum quantity, maximumn unitprice, total quantity, average unitprice, and count of unique order ids.

SELECT MIN(quantity) AS Min_Quantity, MAX(UnitPrice) AS Max_UnitPrice, SUM(Quantity) AS Sum_Quantity, ROUND(AVG(UnitPrice), 2) AS Avg_UnitPrice, COUNT(DISTINCT OrderID)  AS Distinct_Orders 
FROM OrderItem;

-- GROUPING RECORDS
-- We use the "GROUP BY" function to group records. It works well with aggregate functions

-- We want to know the average unitprice by product.

SELECT*
FROM Product;

SELECT ProductName, AVG(UnitPrice) Avg_Price
FROM Product
GROUP BY ProductName
ORDER BY Avg_Price DESC;


SELECT TOP 10 ProductName, AVG(UnitPrice) Avg_Price
FROM Product
GROUP BY ProductName
ORDER BY Avg_Price DESC;

SELECT*
FROM OrderItem;

-- Find the top 5 product based on the total quantity sold.

SELECT TOP 5 ProductId, SUM(Quantity) AS 'Total Quantity'
FROM
OrderItem
GROUP BY ProductId
ORDER BY [Total Quantity] desc;


-- We want to know the average unitprice by each product. Also, order by the average unit price, and find the top 5.
SELECT TOP 5 AVG(UnitPrice) Average_Unit_Price, ProductName
FROM Product
GROUP BY ProductName
ORDER BY Average_Unit_Price DESC;

SELECT*
FROM OrderItem;

-- Fetch the top 5 product by total amount sales.
SELECT TOP 5  ProductId, SUM(UnitPrice*Quantity) AS Total_Sales
FROM OrderItem
GROUP BY ProductId
ORDER BY Total_Sales DESC;


-- FILTERING GROUPED RECORDS
-- We use the keyword "HAVING" to filter grouped records.


-- Get the productId where the total UnitPrice or total quantity is between 40 and 100, and ensure that it is sorted by total quantity in desc order.
SELECT ProductId, SUM(UnitPrice) total_unitprice, SUM(Quantity) total_qty
FROM OrderItem
GROUP BY ProductId
HAVING SUM(UnitPrice) BETWEEN 40 AND 100 OR SUM(Quantity) BETWEEN 40 and 100
ORDER BY total_qty DESC;

-- Get the top 3 products with a total sales greater than $1,000

SELECT TOP 3  ProductID, SUM(UnitPrice) Total_Unit_Price
FROM OrderItem
GROUP BY ProductId
HAVING SUM(UnitPrice) > 1000
ORDER BY Total_Unit_Price DESC;

-- Get the products with an average unit price greater than 50 and total sales greater than $2,000
SELECT ProductId, AVG(UnitPrice) Average_Unit_price, SUM(UnitPrice) Total_Sales
FROM OrderItem
GROUP BY ProductId
HAVING AVG(UnitPrice) > 50
AND SUM(UnitPrice) > 2000
ORDER BY Total_Sales DESC;

-- Get the bottom 3 products with total sales between $1,000 and $5,000, or an average quantity greater than 50.

SELECT TOP 3 ProductID, SUM(UnitPrice) Total_Sales, AVG(Quantity) Average_Quantity
FROM OrderItem
GROUP BY ProductId
HAVING SUM(UnitPrice) BETWEEN 1000 and 5000
OR
AVG(Quantity) > 50
ORDER BY Total_Sales ASC;


-- CASE Statement: it is used to categorize a numerical column into different groups or categories.
-- It allows us to perform conditional logic within a query.

-- "CASE": It is a conditional statement that allows us to perform different actions based on different condition.
-- "WHEN": It is used to specify a condition or multiple conditions that needs to be checked.
-- "THEN": It is used to specify the value or expression that should be assigned when the corressponding condition is met.
-- "ELSE": It is an optional part of the CASE statement that specifies the value or expression to be assigned when none of the previous conditions are met.
-- "END": It is used to mark the end of the CASE statement.

SELECT*
FROM OrderItem;

-- Categorize unitprice into High, Mid, and Low.

SELECT ProductId,
       SUM(UnitPrice) AS total_unitprice,
       CASE 
           WHEN SUM(UnitPrice) / COUNT(*) < 20 THEN 'Low'
           WHEN SUM(UnitPrice) / COUNT(*) >= 20 AND SUM(UnitPrice) / COUNT(*) < 120 THEN 'Mid'
           ELSE 'High'
       END AS ProductValue
FROM OrderItem
GROUP BY ProductId;



SELECT ProductId,
       SUM(UnitPrice) AS total_unitprice,
       CASE 
           WHEN SUM(UnitPrice) < 20 THEN 'Low'
           WHEN SUM(UnitPrice) >= 20 AND SUM(UnitPrice) < 120 THEN 'Mid'
           ELSE 'High'
       END AS ProductValue
FROM OrderItem
GROUP BY ProductId;


-- SUBQUERY

SELECT ProductValue, SUM(total_unitprice) AS total_unitprice
FROM (
    SELECT ProductId,
           SUM(UnitPrice) AS total_unitprice,
           CASE 
               WHEN SUM(UnitPrice) / COUNT(*) < 20 THEN 'Low'
               WHEN SUM(UnitPrice) / COUNT(*) >= 20 AND SUM(UnitPrice) / COUNT(*) < 120 THEN 'Mid'
               ELSE 'High'
           END AS ProductValue
    FROM OrderItem
    GROUP BY ProductId
) AS subquery
GROUP BY ProductValue;


-- JOINS

-- Join operation combines rows from two or more tables based on a related column between them.
-- The tables are joined based on Primary-Foreign Key relationship.

-- Types of Join: Inner, Left, Right, and Full Joins


-- INNER JOIN: It gives what is common to the two tables

-- Fecth the customer info; their names, phone no. etc and the product they purchased.

SELECT*
FROM Customer;

SELECT*
FROM OrderItem;

SELECT c.Id, FirstName, LastName, City, Country, Phone, ProductName, UnitPrice, Package
FROM Customer c
INNER JOIN Product p
ON c.Id = p.Id
ORDER BY UnitPrice DESC;

-- Fetch the top 5 supplier info and the purchases made order by quantity.

SELECT TOP 5 s.id, CompanyName, ContactName, City, Country, Phone, Fax, OrderID, ProductId, UnitPrice, Quantity
FROM Supplier s
INNER JOIN OrderItem o
ON s.Id = o.Id
ORDER BY o.Quantity DESC;


SELECT*
FROM Supplier;


SELECT*
FROM Product;

-- What if we want to pull records like Supplier Company Name, ContactName, and the product purchased with their UnitPrice, order by Contact Name in Desc? 

SELECT s.CompanyName, s.ContactName, p.ProductName, p.UnitPrice
FROM Supplier s
INNER JOIN Product p
ON s.Id = p.Id
ORDER BY ContactName DESC;

SELECT s.CompanyName, s.ContactName, p.ProductName, p.UnitPrice
FROM Supplier s
JOIN Product p
ON s.Id = p.Id
ORDER BY ContactName DESC;

-- Fetch all the columns from Supplier and Product table

SELECT*
FROM Product
JOIN Supplier
ON Supplier.Id = Product.Id;

-- What if we want to join more than two tables?

-- Pull all the records in Customer table, ProductName, UnitPrice, and Package from Product, and also the quantity of items purchased from the OrderItems table. Order by Quantity in Desc.

SELECT c.Id, FirstName, LastName, Country, ProductName, p.Package, o.UnitPrice, o.Quantity
FROM Customer c
JOIN Product p
ON c.Id = p.Id
JOIN OrderItem o
ON p.Id = o.Id
ORDER BY Quantity DESC;

-- 1. Provide the name for each country for every order as well as as the contact name and the sales they generated for the order, order it by sales.

SELECT c.Country, s.ContactName, (Quantity*UnitPrice) Sales
FROM Customer c
JOIN OrderItem o
ON c.Id = o.Id
JOIN Supplier s
ON o.Id = s.Id
ORDER BY Sales;

-- 2. Provide the name for each region for every order, as well as the product name and the unit price they paid for the order. However, you should only provide the results if the order
--quantity exceeds 50. Your final table should have 3 columns; country name, Product name, and UnitPrice.

SELECT c.Country, p.ProductName, o.UnitPrice
FROM Customer c
JOIN Product p
ON c.id = p.id
JOIN OrderItem o
ON p.id = o.Id
WHERE Quantity > 50
ORDER BY UnitPrice DESC;


-- 3. Provide the name for each country for every order as well as as the contact name and the sales they generated for the order, order it by sales. However, you should only provide
-- result where sales exceed 100, and grouped by country.

SELECT c.Country, s.ContactName, (Quantity*UnitPrice) Sales
FROM Customer c
JOIN Supplier s
ON c.Id = s.Id
JOIN OrderItem o
ON s.Id = o.Id
WHERE Quantity*UnitPrice > 100
ORDER BY Sales DESC;

-- What are the total sales for each country where the total sales exceed $100, ordered in descending order by country?

-- Sales cannot work in here to filter, we will use HAVING instead.

SELECT c.Country, SUM(o.Quantity*o.UnitPrice) Sales
FROM Customer c
JOIN Supplier s
ON c.Id = s.Id
JOIN OrderItem o
ON s.Id = o.Id
GROUP BY c.Country
HAVING SUM(o.Quantity*o.UnitPrice) > 100
ORDER BY c.Country DESC;

-- How many contact name of the supplier reps have less than 5 orders that they receive?

SELECT s.ContactName, COUNT(*) num_orders
FROM Supplier s
JOIN OrderItem o
ON s.id = o.id
GROUP BY s.ContactName
HAVING COUNT(*) < 5
ORDER BY num_orders;

SELECT* 
FROM Product;
SELECT* 
FROM OrderItem;
SELECT* 
FROM Supplier;

-- Write an sql query to retrieve the names of suppliers who have placed an order for at least one Tofu or at least one Ikura, along with the total cost of both items
-- ordered by each supplier. The cost of each item should be calculated by multiplying the quantity by the unitprice of the product?


SELECT s.ContactName, p.ProductName, (o.Quantity*o.UnitPrice) Total_Cost
FROM Supplier s
JOIN Product p
ON s.Id = p.Id
JOIN OrderItem o
ON p.Id = o.Id
WHERE p.ProductName IN ('Tofu')
OR
p.ProductName IN ('Ikura')
ORDER BY Total_Cost DESC;

-- Retrieve the list of products that have never been ordered, along with the supplier details.

SELECT s.CompanyName, s.ContactName, s.City, s.Country, p.ProductName
FROM Product p
LEFT JOIN Supplier s
ON p.Id = s.Id
WHERE CompanyName IS NULL

SELECT s.CompanyName, s.ContactName, s.City, s.Country, p.ProductName, s.Phone, s.Fax, s.ContactTitle
FROM Product p
RIGHT JOIN Supplier s
ON p.Id = s.Id
WHERE p.Id NOT IN (SELECT DISTINCT id FROM OrderItem);

SELECT s.CompanyName, s.ContactName, s.City, s.Country, p.ProductName, s.Phone, s.Fax, s.ContactTitle
FROM Product p
RIGHT JOIN Supplier s
ON p.Id = s.Id
WHERE p.Id IN (SELECT DISTINCT id FROM OrderItem);


-- Get the top 3 customers who have placed the most orders, along with their total order count and total order value(quantity by unitprice).

SELECT TOP 3 COUNT(o.Id) Total_order_count, c.FirstName, c.LastName, SUM(o.Quantity*o.UnitPrice) Total_order_value
FROM Customer c
LEFT JOIN OrderItem o
ON c.Id = o.Id
GROUP BY c.id, c.FirstName, c.LastName
ORDER BY Total_order_value DESC;

-- Categorize the products based on their unit price, and display the product name, supplier name, and the price category. Say; unitprice <10 ==> Budget, 
-- Unitprice between 10 and 50 ==> standard, and more than 50 ==> premium.

SELECT p.Productname, s.CompanyName,
CASE
WHEN p.Unitprice < 10 THEN 'Budget'
WHEN p.Unitprice BETWEEN 10 and 50 THEN 'Standard'
ELSE 'Premium'
END as PriceCategory
FROM Product p
LEFT JOIN Supplier s
ON p.Id = s.Id
ORDER BY PriceCategory;


-- SET OPERATORS
-- Set operators allows us to combine the results pf multiple SELECT statements into a single result set.
-- The three main set operators are: Union, Intersect, and Except.

-- Union: Combines the result sets of two or more SELECT statements and removes duplicate records/rows.
-- Intersect: Returns only the rows that are common between the result sets of two SELECT statements.
-- Except: Returns the rows from the first SELECT statement that are not present in the result set of the second SELECT statement.

-- UNION
-- Fetch the ProductName, UnitPrice that is greater than 50 and unit price that is less than 20.

SELECT ProductName, UnitPrice
FROM Product
WHERE UnitPrice > 50
UNION
SELECT ProductName, UnitPrice
FROM Product
WHERE UnitPrice < 20;

-- Fetch the product info where total Sales is greater than $1000 and total Sales is then $10,000, sort the result in Descending order by Sales.
SELECT p.ProductName, SUM(p.UnitPrice*o.Quantity) Sales
FROM Product p
LEFT JOIN OrderItem o 
ON p.Id = o.id
GROUP BY ProductName
HAVING SUM(p.UnitPrice*o.Quantity) > 1000
UNION
SELECT p.ProductName, SUM(p.UnitPrice*o.Quantity) Sales
FROM Product p
LEFT JOIN OrderItem o 
ON p.Id = o.id
GROUP BY ProductName
HAVING SUM(p.UnitPrice*o.Quantity) < 10000
ORDER BY Sales DESC;

--Interset
-- Get the list of customers who haved placed order for both "Tofu" and "Ikura" product


SELECT* FROM Customer

SELECT* FROM OrderItem;

SELECT c.FirstName, c.LastName, p.ProductName
FROM Customer c
JOIN Product p
ON c.id = p.Id
WHERE ProductName = 'Tofu'
INTERSECT
SELECT c.FirstName, c.LastName, p.ProductName
FROM Customer c
JOIN Product p
ON c.id = p.Id
WHERE ProductName = 'Ikura'

SELECT c.FirstName, c.LastName, p.ProductName
FROM Customer c
JOIN Product p
ON c.id = p.Id
WHERE ProductName = 'Tofu'
Union
SELECT c.FirstName, c.LastName, p.ProductName
FROM Customer c
JOIN Product p
ON c.id = p.Id
WHERE ProductName = 'Ikura';

-- EXCEPT

-- Fetch the suppliers whose products are not discontinued but their unit price is greater than 50

SELECT SupplierId, ProductName, UnitPrice, IsDiscontinued
FROM Product
WHERE IsDiscontinued = 0
EXCEPT
SELECT SupplierId, ProductName, UnitPrice, IsDiscontinued
FROM Product
WHERE UnitPrice > 50;


-- SUBQUERY
-- A subquery is a query that is within a query.

-- Types of Subquery: Scalar, Correlated, Uncorrelated, Nested, Subqueries within a SELECT clause, Subqueries within the FROM clause, Subqueries within the WHERE clause.

-- Fetch records of productid, productname, unit prrice, where the unit price is greater than the average unit price from the product table.

SELECT*
FROM Product;

SELECT AVG(UnitPrice) FROM Product; 

SELECT Id, ProductName, UnitPrice
FROM Product
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Product);


-- Scalar Subqueries: it is a subquery that returns a single value.

-- Fetch the productname, unitprice of all the products.
SELECT ProductName, UnitPrice, 
	(SELECT AVG(UnitPrice) FROM Product) avg_unitprice
	FROM Product;

-- This query returns the product name, unitprice, and the average unit price of all products.


-- Correlated Subqueries: A correlated subquery is a subquery that refers to a column in the outer query.

-- Retrieve the productid, orderid for all orders that is discontinued with quantity greater than 10.

SELECT ProductId, OrderId, Quantity
FROM OrderItem o
WHERE EXISTS (
SELECT* FROM Product p
WHERE IsDiscontinued = 1
AND Quantity > 10);

-- Retrieve the list of customers and the total number of orders they have placed, only for customers who have placed more orders than 
-- the average number of orders placed by all customers.

SELECT c.Id, c.FirstName, c.LastName
FROM Customer c
INNER JOIN (
		SELECT Id, COUNT(*) Total_orders
		FROM OrderItem 
		GROUP BY Id ) o 
		ON c.Id = o.Id
		
		WHERE Total_orders > (

		SELECT AVG(Total_orders)
		FROM (
		SELECT COUNT(*) Total_orders
		FROM OrderItem
		GROUP BY Id) t
		)
		ORDER BY Total_orders DESC;

-- There no customers who has placed orders that is more than the average total order.


-- Uncorrelated Subqueries: An correlated subquery is a subquery that is independedent of the outer query.

-- Retreive product name and unit price for all products that have a unit price higher than the average unit price of all products.

SELECT*
FROM Supplier;

SELECT ProductName, UnitPrice
FROM Product
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Product);

SELECT AVG(UnitPrice) avg_price
FROM Product;

-- Retrieve the product name, Unit price, and quantity for all products that have a quantity higher the average quantity of all products.

SELECT p.ProductName, p.UnitPrice, o.Quantity
FROM Product p
JOIN OrderItem o
ON p.Id = o.ID 
WHERE Quantity > (SELECT AVG(Quantity) FROM OrderItem);

SELECT AVG(Quantity) avg_qty
FROM OrderItem

-- Retrieve the product name, unit price, and total quantity for all products that have a total quantity higher than the average total quantity for all/each products.

SELECT p.ProductName, p.UnitPrice, SUM(o.Quantity) AS total_qty
FROM Product p
JOIN OrderItem o ON p.Id = o.ID
GROUP BY p.ProductName, p.UnitPrice
HAVING SUM(o.Quantity) > (SELECT AVG(total_qty) FROM (
    SELECT SUM(o.Quantity) AS total_qty
    FROM Product p
    JOIN OrderItem o ON p.Id = o.ID
    GROUP BY p.ProductName
) AS subquery);
		


-- Nested Subqueries:  A nested subquery is a subquey that is nested within another subquery.

-- Retrieve the list of products supplied by suppliers located in the USA.

SELECT ProductName
FROM Product p
JOIN Supplier s
ON p.SupplierId = s.Id
WHERE COUNTRY = 'USA';

SELECT ProductName
FROM Product p
JOIN Supplier s
ON p.SupplierId = s.Id
WHERE SupplierId IN (SELECT SupplierId FROM Product
						WHERE Country = 'USA');


-- Get the list of customers who have placed orders for all products supplied by the supplier with the highest total revenue.

SELECT c.FirstName, c.LastName, p.ProductName, sq.companyname, sq.total_rev
FROM Customer c
JOIN Product p
ON c.id = p.id
JOIN 
(SELECT s.companyname, (o.UnitPrice*o.Quantity) Total_rev , p.productname FROM OrderItem o
JOIN Supplier s
ON o.id = s.id
JOIN Product p
ON s.id = p.supplierid) sq
ON sq.ProductName = p.ProductName
ORDER BY Total_rev DESC;


-- Find the product names and their respective suppliers that have the highest unitprice among all products.

SELECT p.ProductName, s.CompanyName
FROM Product p
JOIN Supplier s
ON p.SupplierId = s.Id
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Product);

-- Retrieve the customer names and their total order amounts for customers who have placed orders with a total amount greater than the average total order amount across all customers.

SELECT c.FirstName, SUM(o.UnitPrice*o.Quantity) Total_order
FROM Customer c
JOIN OrderItem o
ON o.Id = c.Id
GROUP BY c.FirstName
HAVING SUM(o.UnitPrice*o.Quantity) > (
	SELECT AVG(Total_order) 
	FROM (
	SELECT SUM(o.UnitPrice*o.Quantity) AS Total_order 
	FROM Customer c
	JOIN OrderItem o 
		ON c.ID = o.ID
		GROUP BY c.FirstName) subquery
);

SELECT c.FirstName, c.LastName, SUM(o.UnitPrice * o.Quantity) AS Total_order
FROM Customer c
JOIN OrderItem o ON c.ID = o.ID
GROUP BY c.FirstName, c.LastName
HAVING SUM(o.UnitPrice * o.Quantity) > (
    SELECT AVG(Total_order)
    FROM (
        SELECT SUM(o.UnitPrice * o.Quantity) AS Total_order
        FROM Customer c
        JOIN OrderItem o 
		ON c.ID = o.ID
        GROUP BY c.ID
    ) AS subquery
);


-- Subqueries in the SELECT clause: Subqueries can be used in the SELECT clause to return a single value.

-- Retrieve product name, unitprice, and the average unit price of all products.

SELECT ProductName, UnitPrice, 
(SELECT AVG(UnitPrice) FROM Product) AS Avg_UnitPrice
FROM Product;

-- Write a query to get the list of customers and their total order value, along with the overall average order value.
SELECT c.FirstName, c.LastName, SUM(Quantity*UnitPrice) AS Cus_Total_Order_Value, 
(SELECT AVG(UnitPrice*Quantity) FROM OrderItem) AS Overall_Average
FROM Customer c
JOIN OrderItem o
ON c.id = o.Id
GROUP BY c.FirstName, c.LastName;

SELECT AVG(Quantity * UnitPrice) AS Overall_Avg
FROM OrderItem;


-- Retrieve the customer names, their total order values, and the ratio of their total order value to the maximum total order value across all customers.
SELECT c.FirstName, c.LastName, 
       SUM(o.Quantity * o.UnitPrice) AS total_order_value,
       SUM(o.Quantity * o.UnitPrice) / (
           SELECT MAX(total_order_value)
           FROM (
               SELECT SUM(o.Quantity * o.UnitPrice) AS total_order_value
               FROM OrderItem o
               JOIN Customer c ON c.Id = o.Id
               GROUP BY c.Id
           ) subquery
       ) AS order_value_ratio
FROM Customer c
JOIN OrderItem o ON c.Id = o.Id
GROUP BY c.Id, c.FirstName, c.LastName;


------------------------

--Subqueries in the FROM Clause: Subqueries can be used in the FROM clause to create a derived table.

-- Retrieve customerid, Company name and the total number of orders for each customer


SELECT c.Id, s.CompanyName, COUNT(*) TotalOrders
FROM Customer c
JOIN Supplier s
ON c.Id = s.Id
GROUP BY c.Id, s.CompanyName;

-------------------------------------------------------------------

SELECT* FROM [OrderItem]
SELECT* FROM [order]
SELECT* FROM [Customer]
SELECT* FROM [Supplier]
SELECT* FROM [Product]

--- ## Review on SQL SUBQUERIES
-- Find all the products with UnitPrice greater than the maximum price
SELECT ProductName,UnitPrice
FROM Product
WHERE UnitPrice > (SELECT MIN(UnitPrice) FROM Product);

-- Find all customers who live in the same cities as suppliers in the UK.
SELECT FirstName, LastName
FROM Customer
WHERE City IN (SELECT City FROM Supplier WHERE Country = 'UK');

-- Find all customers who have placed an order

SELECT FirstName, LastName
FROM Customer c
WHERE EXISTS (SELECT 1 FROM [Order] o WHERE o.CustomerId = c.Id);


-- Find all product priced above the average unitprice of products supplied by suppliers from Japan.

SELECT ProductName
FROM Product
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Product WHERE SupplierId IN 
(SELECT Id FROM Supplier WHERE Country = 'Japan'));

-- Task 1
-- Find the names of customers who have placed an order totalling  more than a $1000.

SELECT FirstName, LastName
FROM Customer 
WHERE Id IN (SELECT CustomerId FROM [Order]  WHERE TotalAmount > 1000);

SELECT c.FirstName, c.LastName, sq.[Aggregated total]
FROM Customer c
JOIN
(
SELECT o.CustomerId, SUM(o.TotalAmount) 'Aggregated total'
FROM [Order] o
WHERE o.TotalAmount > 1000
GROUP BY o.CustomerId
) sq
ON c.id = sq.CustomerId;

----------------------------------

-- Task 2
-- List all products along with their supplier if the product's unit price is above the average unitprice.



SELECT p.ProductName, s.ContactName, p.UnitPrice
FROM Product p
JOIN Supplier s
ON p.SupplierId = s.Id
WHERE p.UnitPrice >
(SELECT AVG(UnitPrice) FROM Product);

-- Task 3
-- Find all customers who have never placed an order.

SELECT c.FirstName, c.LastName, o.CustomerId
FROM Customer c 
LEFT JOIN [Order] o
ON o.CustomerId = c.Id
WHERE o.CustomerId IS NULL; 


SELECT c.FirstName, c.LastName
FROM Customer c
WHERE Id NOT IN (SELECT o.CustomerId FROM [Order] o);


-- Find customers who have placed more than five orders.

SELECT sq.FirstName, sq.LastName, sq.[Number of Order]
FROM
(SELECT COUNT(c.FirstName) 'Number of Order', c.FirstName, c.LastName, o.CustomerId
FROM Customer c
JOIN [Order] o
ON c.id = o.CustomerID
GROUP BY c.FirstName, c.LastName, o.CustomerId) sq
WHERE [Number of Order] > 5;


SELECT FirstName, LastName
FROM Customer
WHERE Id IN (SELECT CustomerId FROM [Order] GROUP BY CustomerId HAVING COUNT(*) > 5);


SELECT sq.FirstName, sq.LastName, sq.[Number of Order]
FROM
(SELECT COUNT(*) 'Number of Order', c.FirstName, c.LastName, o.CustomerId
FROM Customer c
JOIN [Order] o
ON c.id = o.CustomerID
GROUP BY c.FirstName, c.LastName, o.CustomerId) sq
WHERE [Number of Order] > 5;


-- CREATING VIEWS IN SQL
-- A view is a virtual table based on the result-set of an SQL statement.  Views do not store data themselves but query data from the tables they are built on.

-- Syntax

CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

-- create a view for active products
CREATE VIEW ActiveProducts AS
SELECT Id, ProductName, UnitPrice, Package
FROM Product
WHERE IsDiscontinued = 0;

--This view, 'ActiveProducts', show all products that are not discontinued.
SELECT*
FROM ActiveProducts;

-- Create a view for customer orders
CREATE VIEW CustomerOrders AS
SELECT o.Id AS OrderId, c.FirstName, c.LastName, o.OrderDate, o.TotalAmount
FROM [Order] o
JOIN Customer c 
ON o.CustomerId = c.Id;

-- This view, 'CustomerOrders' combines customer and order details.
SELECT*
FROM CustomerOrders;

-- To view all the VIEWS created
SELECT
	table_name AS 'VIEW'
FROM INFORMATION_SCHEMA.VIEWS;

SELECT*
FROM INFORMATION_SCHEMA.VIEWS;


-- WITH Subquery Use Case
-- The 'WITH' clause allows us to define a temporary named result set, known as a Common Table Expression (CTE); that we can reference within the main query.

--Syntax

WITH cte_name AS (
	SELECT column1, column2, ...
	FROM table_name
	WHERE condition
	)
	SELECT column1, column2, ...
	FROM table_name
	WHERE condition;

-- Calculate total sales for each customer

WITH CustomerSales AS (
	SELECT o.CustomerId, SUM(o.TotalAmount) AS TotalSpent
	FROM [Order] o
	GROUP BY CustomerId
	)
	SELECT c.FirstName, c.LastName, cs.TotalSpent
	FROM CustomerSales cs
	JOIN Customer c ON cs.CustomerId = c.Id;

-- List Products with total quantities ordered.

WITH Product_Quantites AS (
SELECT o.ProductID, SUM(o.Quantity) Total_Quantity
FROM OrderItem o
GROUP BY o.ProductId
)
SELECT pq.Total_Quantity, p.ProductName
FROM Product_Quantites pq
JOIN Product p
ON p.id = pq.ProductId;


-- Common Table Expressions (CTEs)

--- Identiify customers with mulltiple orders

WITH CustomerOrderCount AS (
	SELECT CustomerId, COUNT(*) AS OrderCount
	FROM [Order]
	GROUP BY CustomerId
)
SELECT c.FirstName, c.LastName, coc.OrderCount
FROM CustomerOrderCount coc
JOIN Customer c
ON coc.CustomerId = c.Id
WHERE coc.OrderCount > 1
ORDER BY OrderCount DESC;

-- Calculate average order amount per customer

WITH OrderCTE AS (
SELECT o.CustomerID, AVG(o.TotalAmount) 'Avg_Total_Amount'
FROM [Order] o
GROUP BY o.CustomerId
)
SELECT c.FirstName, c.LastName, cte.Avg_Total_Amount
FROM Customer c
JOIN OrderCTE cte
ON cte.CustomerId = c.Id;

-- Create a view for discontinued  products

CREATE VIEW DiscontinuedProducts AS
SELECT Id, ProductName, UnitPrice, Package
FROM Product
WHERE IsDiscontinued = 1;


SELECT*
FROM DiscontinuedProducts;

-- Write a CTE to calculate the total number of products ordered by each customer.

WITH cte AS
(SELECT o.ID, SUM(o.Quantity) Total_Num_Products
FROM OrderItem o
GROUP BY o.id)
SELECT c.Firstname, c.lastname, cte.total_num_products
FROM Customer c
JOIN cte
ON cte.id = c.id;

-------------------------

WITH TotalProductsOrdered AS (
	SELECT o.CustomerId, SUM(Quantity) AS TotalQuantity
	FROM [Order] o
	JOIN OrderItem oi
	ON o.Id = oi.OrderId
	GROUP BY o.CustomerId
	)
	SELECT c.FirstName, c.LastName, tpo.TotalQuantity
	FROM TotalProductsOrdered tpo
	JOIN Customer c
	ON tpo.CustomerId = c.Id
	ORDER BY tpo.TotalQuantity DESC;


-- Create a view for high-value orders
-- Hint ==> High-value orders are total orders above $1000

CREATE VIEW HighValueOrders AS
SELECT OrderNumber, CustomerID, TotalAmount
FROM [Order]
WHERE TotalAmount > 1000;

SELECT* FROM HighValueOrders;


-- Create a view to show the details of all orders placed in the last 30 days.

CREATE VIEW Orders_In_Last_30_Days
AS
SELECT* FROM [Order]
WHERE OrderDate BETWEEN 2024-04-06 and 2024-04-07;

SELECT* FROM Orders_In_Last_30_Days;


-- To Drop a view
DROP VIEW Orders_In_Last_30_Days;



CREATE VIEW Orders_In_Last_2_Years
AS
SELECT* FROM [Order]
WHERE OrderDate >= DATEADD(YEAR, -2, GETDATE());

SELECT* FROM [Order]

SELECT* FROM Orders_In_Last_2_Years;


-- Data Cleaning and Manipulation Method.

-- The following methods are widely used for string manipulation, type casting, and handling of null values:

--1. LEFT() and RIGHT()
--2. SUBSTR()
--3. POSITION() and STRPOS()
--4. CONCAT()
--5. CAST()
--6. COALESCE()


-- LEFT() and RIGHT()
-- LEFT(string, number): it extract  specified number of characters from the left side of a string.
-- RIGHT(string, number): it extract  specified number of characters from the right side of a string.


-- Extract the first 3 characters from the left of "Hello World"
SELECT LEFT('Hello World', 3) output;

-- Extract the first 3 characters from the right of "Hello World"

SELECT RIGHT('Hello World', 3) output;

SELECT*
FROM Customer;

-- Fetch the first 3 characters of each country's name.

SELECT Country,
		LEFT(Country, 3) First_3_chars
FROM
Customer;

-- Fetch the last 4 charcters of each country's name.

SELECT Country,
		RIGHT(Country, 4) First_4_chars
FROM
Customer;

-- CONCAT(): it concatenate two or more strings into one string

--syntax
CONCAT(string1, string2, ...);

-- Concat "John" and "Smith"

SELECT CONCAT('John', ' ', 'Smith') fullname;

SELECT CONCAT('John ', 'Smith') AS Full_name

-- Concat the fistname and lastname, and extract their initials in a diffrent/new column.
SELECT Firstname, Lastname, LEFT(Firstname, 1) 'I1', LEFT(LastName, 1) 'I2'
FROM Customer;

SELECT 
	CONCAT(FirstName, ' ', LastName) FullName,
	LEFT(Firstname, 1) + LEFT(LastName, 1) AS Initials
FROM 
Customer;

SELECT 
	CONCAT(FirstName, ' ', LastName) FullName,
	CONCAT(LEFT(Firstname, 1), LEFT(LastName, 1)) AS Initials
FROM 
Customer;


-- SUBSTR(): it extract a substring starting from a specified position with a specified length.

-syntax
SUBSTRING(string, start_position, length);

-- Extract 5 characters starting from the 7th position of "Hello World"
SELECT SUBSTRING('Hello World', 7, 5);

SELECT* FROM [Order]

-- Extract a portion of a customer's name, we want extract the first  3 characters of the FistName and the last 3 characters of the LastName.
SELECT
	SUBSTRING(FirstName, 1, 3) first_2_chars,
	RIGHT(LastName, 3) last_3_chars
FROM
Customer;

-- Extrac the year, month, and day on a different column from the order table.

SELECT 
    OrderDate,
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    DAY(OrderDate) AS Day
FROM [Order];

-- extracts the year and number parts of the ORDER NO column in the Order table.
SELECT
    SUBSTRING(ORDERNUMBER, 1, 2) AS OrderYear,
    SUBSTRING(ORDERNUMBER, 3, 4) AS OrderNumber
FROM
    [Order];



-- CHARINDEX : it returns the starting position of the first occurence of substring within a string. If the substring is not found, it returns 0.

-- syntax
CHARINDEX(substring, string, [start_location])


--  STRPOS() : equivalent to POSITION() in some sql flavors.

-- Find the position of 'WORLD' in the string 'HELLO WORLD'
SELECT CHARINDEX('world', 'hello, world!');

SELECT CHARINDEX('foo', 'Hello, world!');

SELECT CHARINDEX('l', 'Hello, world!', 3);


SELECT* 
FROM Customer;

-- Fetch the customer names that contains the 'Leb' and display the position of the first occurence of 'Leb' in the LastName column.

WITH cte AS (
SELECT Id, Firstname, LastName,
	CHARINDEX('Leb', LastName) AS LebPosition
FROM Customer)
SELECT Id, Firstname, LastName, LebPosition
FROM cte
WHERE LebPosition > 0;

SELECT Id, Firstname, LastName,
	CHARINDEX('Leb', LastName) AS LebPosition
FROM Customer
WHERE CHARINDEX('Leb', LastName) > 0;

SELECT*
FROM Supplier;


-- Retrieve the supplier names that contains the substring "Co" and display the position of the first occurence of "Co" in the CompanyName.

SELECT CompanyName, CHARINDEX('Co', CompanyName) 'Character Index'
FROM Supplier
WHERE CHARINDEX('Co', CompanyName) >0


-- CAST():  it is used to convert an expression from one data type to another.

-- syntax
CAST(expression AS data_type)

-- Convert the string '123' to an integer
SELECT CAST('123' AS INT);

-- Convert the UnitPrice of the Product table to an integer and display it.

SELECT ProductName, CAST(UnitPrice AS INT) AS PriceInt
FROM Product;

SELECT* 
FROM OrderItem;

-- USe CAST() to convert the OrderDate from the Order table to a string.

SELECT OrderDate, CAST (Orderdate AS varchar) 'Cast'
FROM [Order];

-- Convert the UnitPrice and Quantity columns to Decimal data types before performing calculation to get the Revenue in 2 decimal places.
SELECT OrderId,
	CAST(UnitPrice AS Int) * CAST(Quantity AS Int) AS Revenue
FROM OrderItem;

-- DATEDIFF()/ DATEPART(): These functions work with date and time data types.
SELECT*
FROM [Order];

SELECT DATEDIFF(day, 2012-07-04, 2012-07-08) AS days_of_delivery;

-- REPLACE(): we can use this to replace a substring in a string.

--syntax
REPLACE(expression, old value, new value)

SELECT*
FROM Customer;

-- Replace 'Berlin' with another city in Germany --> Munich
SELECT City, 
	REPLACE(City, 'Berlin', 'Munich') AS ModifiedCity
FROM Customer

WHERE City = 'Berlin';

SELECT*
FROM SUpplier;

-- Replace Company with LTD to Corporation in Supplier table
SELECT CompanyName, REPLACE (CompanyName, 'LTD', 'Corp')
FROM Supplier;

-- UPPER() AND LOWER(): 
-- Retrieve the customer in Upper case

SELECT FirstName, LastName, UPPER(CONCAT(FirstName,' ', LastName)) AS FullName
FROM Customer;

-- Retrieve Company Name in Lower Case
SELECT CompanyName, LOWER(CompanyName) 'Lower'
FROM Supplier;

-- FORMAT(): it is used to apply custom formatting.
-- Rerieve the OrderDate in DD-MM-YYYY format

SELECT OrderDate, FORMAT(OrderDate, 'dd-MM-yyyy') AS NewDate
FROM [Order];

-- Format a number as currency using the UnitPrice with 'en-US' culture.
SELECT*
FROM Product;

SELECT ProductName, UnitPrice,
	FORMAT(UnitPrice, 'C', 'en-US') AS FormatedUnitPrice
FROM Product;

-- Retrieve the Revenue in the British Currency allong with their ProductName.

WITH cte as (
SELECT p.ProductName, SUM(o.Quantity*o.UnitPrice) AS 'Revenue'
FROM Product p
JOIN OrderItem o
ON p.Id = o.ProductId
GROUP BY ProductName) 
SELECT cte.ProductName, cte.Revenue, FORMAT(cte.Revenue, 'C', 'en-gb') AS ModifiedRevenue
FROM cte;

SELECT ProductName, 
	FORMAT(SUM(o.Quantity * o.UnitPrice), 'C', 'en-GB') AS ModifiedRevenue
FROM Product p
	JOIN OrderItem o
	ON p.Id = o.ProductId
GROUP BY ProductName;

-- STUFF(): is used to replace a substring within a string with another substring. It is similar to REPLACE() function but with some additional 
-- flexibility.

-- syntax
-- STUFF(Expression, starting_position, number of character, what to replace)

SELECT* FROM [Order];

-- Add the 'ORD' to the OrderNumber from the left position in Order table.

SELECT 
	OrderNumber,
	STUFF(OrderNumber, 1, 2, 'ORD') AS ModifiedOrderNumber
FROM [Order];


-- WIndow Function
-- It is a powerful feature in SQL that allows us to perform calculations across a set of table rows related to the current. 
-- These calculations include running total, moving averages, and ranking function. 

-- CORE WINDOW FUNCTION

-- Partition By: it divides the result of our query into partition to which the window function. Similar to Group By clause but does not collapse the 
-- result set.

-- Example:
-- Calculate the total amount spent by each customer using the `Partition By` clause.

SELECT CustomerId, OrderDate, TotalAmount, 
	SUM(TotalAmount) OVER(PARTITION BY CustomerId) AS TotalSpentByCustomer
FROM [Order];

--Over: it specifies the window over which a window function operates. it defines the partitioning and ordering of rows.

-- Calculate the average total amount spent by each customer using the 'Partition By' clause.
SELECT CustomerID, OrderDate, TotalAmount, 
AVG(TotalAmount) OVER(PARTITION BY CustomerID) AS AvgSpent
FROM [Order]


-- Ranking Functions

--1. Row_Number(): it is a function that assigns a unique sequentital integer to rows within a partition.

-- Assign a row number to each order for a customer;
SELECT* FROM [Order];

SELECT CustomerId, Id, ROW_NUMBER() OVER (PARTITION BY CustomerId ORDER BY OrderDate) AS RowNumber
FROM [Order];

-- 2. Fetch the top 3 orders for each customer.

WITH cte AS (
SELECT CustomerID, ID, OrderDate, ROW_NUMBER()OVER(PARTITION BY CustomerId ORDER BY OrderDate DESC) AS 'RowNumber'
FROM [Order]
)
SELECT cte.CustomerID, cte.ID, cte.OrderDate, cte.rownumber
FROM cte
WHERE cte.RowNumber <=3

-- Rank the products for each supplier based on the total revenue generated.
SELECT p.Id, p.ProductName, p.SupplierId, SUM(o.Quantity * o.UnitPrice) AS TotalRevenue,
ROW_NUMBER() OVER (PARTITION BY p.SupplierId ORDER BY SUM(o.Quantity * o.UnitPrice) Desc) AS RevenueRank
FROM OrderItem o
JOIN Product p ON p.Id = o.ProductId
JOIN supplier ON o.Id = p.SupplierId
GROUP BY p.Id, p.ProductName, p.SupplierId;

-- Fetch the top3 records for each customer, ordered by the total amount order in descending order.
SELECT* FROM [Order]

WITH cte AS (SELECT CustomerId, Id, OrderDate, TotalAmount,
	ROW_NUMBER() OVER(PARTITION BY CustomerId ORDER BY TotalAmount Desc) AS OrderRank
FROM [Order])
SELECT cte.CustomerId, cte.Id, cte.OrderDate, cte.TotalAmount, cte.OrderRank
FROM cte
WHERE cte.OrderRank <=3;

-- RANK(): It assigns a rank to rows within a partition, with gaps in rank values when there are ties.

-- fetch records for each customer, ordered by total amount in desc.

SELECT CustomerId, OrderDate, TotalAmount,
	RANK() OVER(PARTITION BY CustomerId ORDER BY TotalAmount Desc) AS Rank
FROM [Order];

SELECT* FROM Product;

-- Fetch the records for each product ordered by unitprice
SELECT Id, ProductName, UnitPrice,
	RANK() OVER(PARTITION BY UnitPrice ORDER BY UnitPrice Desc) AS PriceRank
FROM Product;

WITH cte AS (SELECT Id, ProductName, UnitPrice,
	ROW_NUMBER() OVER(PARTITION BY UnitPrice ORDER BY UnitPrice Desc) AS PriceRank
FROM Product
ORDER BY UnitPrice Desc)
SELECT cte.Id, cte.ProductName, cte.UnitPrice, cte.PriceRank
FROM cte
ORDER BY cte.PriceRank Desc;

WITH cte AS (
  SELECT 
    Id, 
    ProductName, 
    UnitPrice,
    ROW_NUMBER() OVER (ORDER BY UnitPrice DESC) AS PriceRank
  FROM Product
)
SELECT 
  cte.Id, 
  cte.ProductName, 
  cte.UnitPrice, 
  cte.PriceRank
FROM cte
ORDER BY cte.PriceRank;

-- DENSE_RANK(): it is a function similar to the RANK() function, but it handles tied values differently. Unlike RANK(), DENSE_RANK() does not
-- leave gaps in the ranking sequence when there are  tied values.

-- Rank the customer total amount spent on each product.

SELECT p.Id, o.CustomerId, p.ProductName, o.TotalAmount, 
	DENSE_RANK() OVER(PARTITION BY p.ProductName  ORDER BY o.TotalAmount DESC) AS TotalAmountRank
FROM [Order] o
JOIN Product p
ON p.id = o.CustomerId
ORDER BY TotalAmountRank ASC;

With cte AS (SELECT p.Id, o.CustomerId, p.ProductName, o.TotalAmount, 
	DENSE_RANK() OVER(PARTITION BY p.ProductName  ORDER BY o.TotalAmount DESC) AS TotalAmountRank
FROM [Order] o
JOIN Product p
ON p.id = o.CustomerId
GROUP BY ProductName
ORDER BY TotalAmountRank)
SELECT cte.ProductName, cte.TotalAmount, cte.TotalAmountRank
FROM cte
ORDER BY cte.TotalAmountRank;


-- Percent_Rank(): This function calculates the relative rank of a value with a group of values. It returns a value between 0 and 1, where 0 is
-- the lowest rank and 1 is the highest rank.

-- # Example
-- Suppose we have a table of products with Id, ProductName, Package, UnitPrice, and IsDiscontinued. Write a query to calculate  the percent rank
-- of each product's unit price within their supplier.

SELECT SupplierId, ProductName, Package, UnitPrice,
	PERCENT_RANK() OVER(PARTITION BY SupplierId ORDER BY UnitPrice DESC) AS UnitPricePercentRank
FROM Product;

-- Write a query to calculate the percent rank of each product's total amount within its Product Category.

SELECT* FROM Supplier
SELECT p.Id, p.ProductName, o.TotalAmount,
	PERCENT_RANK() OVER(PARTITION BY p.Id ORDER BY o.TotalAmount DESC) AS TotalAmountPercentRank
FROM Product p
LEFT JOIN [Order] o 
ON p.Id = o.Id
ORDER BY p.Id, p.ProductName, o.TotalAmount;

-- Write a query to calculate the percent rank of each product's Total revenue within it order's country.
SELECT s.country, p.productname, SUM(o.UnitPrice*o.Quantity) 'Total_Revenue',
PERCENT_RANK() OVER (PARTITION BY s.country ORDER BY SUM(o.UnitPrice*o.Quantity) desc) AS Perc
FROM Product p
JOIN OrderItem o
ON o.id = p.Id
RIGHT JOIN Supplier s
ON s.id = p.supplierid
GROUP BY s.country, p.ProductName;

-- CUME_DIST(): This function calculates distribution of a value within a group. It returns a value between 0 and 1, where 0 represents the lowest
-- value and 1 represents the highest value.

-- # Example
-- Write a query to calculate the cummulative distribution of each product's unit price within its category.

SELECT Id, ProductName, SupplierID, UnitPrice,
	CUME_DIST() OVER(PARTITION BY SupplierId ORDER BY UnitPrice DESC) AS UnitPriceCumDist
FROM Product;


--LAG(): The function allows us to access data from a previous row in the same result. it takes three arguments:

--1. The column we want to access from the previous row
--2. The number of rows to look back (default is 1)
--3. An optional default value to use if there no previous row.

-- Example:
-- Write a query to calculate the total amount for each product compared to their previous year.

SELECT o.Id, p.ProductName, o.TotalAmount,
	LAG(o.TotalAmount, 1, 0) OVER(PARTITION BY o.Id ORDER BY o.TotalAmount) AS PrevYearTotalAmount,
	TotalAmount - LAG(o.TotalAmount, 1, 0) OVER(PARTITION BY o.Id ORDER BY o.TotalAmount) AS TotalAmountIncrease
FROM [Order] o
JOIN Product p 
ON o.Id = p.Id;

-- Write a query to calculate the total amount generated for each country compared to their previous year.

SELECT o.Id, s.Country, o.TotalAmount,
	LAG(o.TotalAmount, 1, 0) OVER(PARTITION BY o.Id ORDER BY o.TotalAmount) AS PrevYearTotalAmount,
	TotalAmount - LAG(o.TotalAmount, 1, 0) OVER(PARTITION BY o.Id ORDER BY o.TotalAmount) AS TotalAmountIncrease
FROM [Order] o
JOIN Supplier s
ON o.Id = s.Id;

-- write a query to get the difference in order total amount between the current and previous order for each customer.
SELECT c.Id, c.FirstName, c.LastName, o.TotalAmount,
	o.TotalAmount - LAG(o.TotalAmount, 1, 0) OVER(PARTITION BY c.Id ORDER BY c.FirstName, c.LastName) OrderTotalDiff,
	LAG(o.TotalAmount, 1, 0) OVER(PARTITION BY c.Id ORDER BY c.FirstName, c.LastName) AS PrevOrderTotalAmount 
FROM Customer c
RIGHT JOIN [Order] o
ON c.Id = o.Id
ORDER BY c.FirstName, c.LastName;

-- LEAD(): This function allows us to access data from a future row in the same result set. It takes the same arguments as LAG() but it looks
-- forward instead of backward.

-- Write a query to calculate the difference in Total Sales Amount between the current total sales amount and the next total sales amount 
-- for each product category.

SELECT ProductId, SUM(UnitPrice * Quantity) As TotalSalesAmount,
	LEAD(SUM(UnitPrice * Quantity), 1, 0) OVER(PARTITION BY ProductId ORDER BY ProductId) - SUM(UnitPrice * Quantity) AS NextTotalSalesDiff
FROM OrderItem
GROUP BY ProductId;

-- -- write a query to get the difference in order total amount between the current and next order total amount for each customer.
SELECT c.Id, c.FirstName, c.LastName, o.TotalAmount,
	LEAD(o.TotalAmount, 1, 0) OVER(PARTITION BY c.Id ORDER BY c.FirstName, c.LastName) -  o.TotalAmount AS OrderTotalAmountDiff  ,
	LEAD(o.TotalAmount, 1, 0) OVER(PARTITION BY c.Id ORDER BY c.FirstName, c.LastName) AS NextOrderTotalAmount 
FROM Customer c
RIGHT JOIN [Order] o
ON c.Id = o.Id
ORDER BY c.FirstName, c.LastName;

-- ADVANCED SQL JOINS

--We are have advanced SQL joins:
--1. Self Join
--2. Cross Join
--3. Full Outer Join

-- SELF JOIN: It is a type of join where a table is joined with itself, based on a related column between rows. This is useful for comparing 
-- values within the same table, such as finding hierarchical relationships.

-- How can we find customers who have placed more than one order, and list those orders?

SELECT a.CustomerId AS Customer_A,
		b.CustomerId AS Customer_B,
		a.Id AS Order_A,
		b.Id AS Order_B
FROM [Order] a
JOIN [Order] b
ON a.CustomerId = b.CustomerId
WHERE a.Id != b.Id;

SELECT* FROM  [Order]

-- How can we compare order dates for a customer to find if they placed orders on consecutive days?

SELECT a.CustomerId,
		a.Id AS Order_A,
		b.Id AS Order_B,
		a.OrderDate AS OrderDate_A,
		b.OrderDate AS OrderDate_B
FROM [Order] a
JOIN [Order] b
ON a.CustomerId = b.CustomerId
WHERE a.Id <> b.Id AND DATEDIFF(day, a.OrderDate, b.OrderDate) = 1;

-- Cross JOIN: It returns the cartesian product of two tables, combining each row of the first table with all rows in the second table.
-- This is useful for generating all possible combinations of records.

-- How can we generate a list of all possible product-supplier pairs, even if a supplier does not supply certain product?

SELECT p.ProductName, s.ContactName
FROM Product p
CROSS JOIN Supplier s;

-- How can we use a cross join to create a grid of all possible combinations of customers and products for potential marketing analysis?

SELECT c.Id AS CustomerId, c.FirstName, c.LastName, p.Id AS ProductId, p.ProductName
FROM Customer c
CROSS JOIN Product p;


-- FULL Outer Join:It returns all rows from both tables, regardless of whether there is a match or nor. If there is no match, the result will 
-- include NULL values for the missing columns.

-- How can we list all customers and their orders, including customers who have not placed any orders, along with their respective orders
-- and the products in those orders, even if some orders do not have associated products?

SELECT c.FirstName, c.LastName,
		c.Id, p.ProductName
FROM Customer c
FULL OUTER JOIN [Order] o ON c.Id = o.Id
FULL OUTER JOIN OrderItem oi ON oi.ProductId = o.Id
FULL OUTER JOIN Product p ON oi.ProductId = p.Id
WHERE p.ProductName IS NULL OR c.FirstName IS NULL;

-- How can we find all products that have ordered, including those that have never been ordered, along with their order details if available?
