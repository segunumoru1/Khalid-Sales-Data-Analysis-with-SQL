# Khalid Sales Data Analysis using SQL

## Table of Contents
1. [Introduction](#introduction)
2. [Database Structure](#database-structure)
   - [Supplier Table](#supplier-table)
   - [Customer Table](#customer-table)
   - [Product Table](#product-table)
   - [Order Table](#order-table)
   - [OrderItems Table](#orderitems-table)
3. [Data Relationships](#data-relationships)
4. [SQL Queries and Analysis](#sql-queries-and-analysis)
   - [Supplier Analysis](#supplier-analysis)
   - [Customer Analysis](#customer-analysis)
   - [Product Analysis](#product-analysis)
   - [Order Analysis](#order-analysis)
   - [OrderItems Analysis](#orderitems-analysis)
5. [Business Insights and Recommendations](#business-insights-and-recommendations)

## Introduction
This provides a comprehensive overview of the Khalid Sales Data Analysis using SQL. The database consists of five main tables: Supplier, Customer, Product, Order, and OrderItems. This document outlines the structure of each table, the relationships between the tables, and various SQL queries used to extract meaningful insights.

## Database Structure

### Supplier Table
The `Supplier` table contains information about the suppliers who provide products to the company.

- **Columns**:
  - `id` (Primary Key): Unique identifier for each supplier.
  - `company_name`: Name of the company.
  - `contact_name`: Contact person at the supplier.
  - `contact_title`: Contact title of the supplier.
  - `city`: City of the supplier.
  - `country`: Country of the supplier.
  - `phone`: Phone number of the contact person.
  - `fax`: Fax address of the supplier.

### Customer Table
The `Customer` table contains information about the customers who purchase products from the company.

- **Columns**:
  - `id` (Primary Key): Unique identifier for each customer.
  - `first_name`: First name of the customer.
  - `last_name`: Last name of the customer.
  - `phone`: Phone number of the contact person.
  - `country`: Country of the customer.
  - `city`: City of the customer.

### Product Table
The `Product` table contains information about the products available for sale.

- **Columns**:
  - `id` (Primary Key): Unique identifier for each product.
  - `product_name`: Name of the product.
  - `supplier_id` (Foreign Key): Identifier linking to the Supplier table.
  - `package`: Package details of the product.
  - `unit_price`: Price per unit of the product.
  - `isdiscontinued`: Indicates if the product is discontinued (0/1).

### Order Table
The `Order` table contains information about customer orders.

- **Columns**:
  - `id` (Primary Key): Unique identifier for each order.
  - `order_number`: Unique number for each order.
  - `customer_id` (Foreign Key): Identifier linking to the Customer table.
  - `order_date`: Date when the order was placed.
  - `total_amount`: Total amount for the order.

### OrderItems Table
The `OrderItems` table contains information about the individual items within an order.

- **Columns**:
  - `id` (Primary Key): Unique identifier for each order item.
  - `order_id` (Foreign Key): Identifier linking to the Order table.
  - `product_id` (Foreign Key): Identifier linking to the Product table.
  - `quantity`: Quantity of the product ordered.
  - `unit_price`: Price per unit of the product.

## Data Relationships
The relationships between the tables are as follows:
- The `Supplier` table is linked to the `Product` table via the `supplier_id`.
- The `Customer` table is linked to the `Order` table via the `customer_id`.
- The `Order` table is linked to the `OrderItems` table via the `order_id`.
- The `Product` table is linked to the `OrderItems` table via the `product_id`.

## SQL Queries and Analysis

### Supplier Analysis

1. **Total Number of Suppliers**:
   ```sql
   SELECT COUNT(*) AS total_suppliers
   FROM Supplier;
   ```

2. **Suppliers Providing the Most Products**:
   ```sql
   SELECT s.company_name, COUNT(p.id) AS product_count
   FROM Supplier s
   JOIN Product p ON s.id = p.supplier_id
   GROUP BY s.company_name
   ORDER BY product_count DESC;
   ```

3. **Supplier Locations**:
   ```sql
   SELECT country, COUNT(*) AS supplier_count
   FROM Supplier
   GROUP BY country
   ORDER BY supplier_count DESC;
   ```

### Customer Analysis

1. **Total Number of Customers**:
   ```sql
   SELECT COUNT(*) AS total_customers
   FROM Customer;
   ```

2. **Top 5 Customers by Total Amount Spent**:
   ```sql
   SELECT c.first_name, c.last_name, SUM(o.total_amount) AS total_spent
   FROM Customer c
   JOIN `Order` o ON c.id = o.customer_id
   GROUP BY c.first_name, c.last_name
   ORDER BY total_spent DESC
   LIMIT 5;
   ```

3. **Customer Distribution by Country**:
   ```sql
   SELECT country, COUNT(*) AS customer_count
   FROM Customer
   GROUP BY country
   ORDER BY customer_count DESC;
   ```

### Product Analysis

1. **Total Number of Products**:
   ```sql
   SELECT COUNT(*) AS total_products
   FROM Product;
   ```

2. **Top 5 Most Expensive Products**:
   ```sql
   SELECT product_name, unit_price
   FROM Product
   ORDER BY unit_price DESC
   LIMIT 5;
   ```

3. **Discontinued Products Count**:
   ```sql
   SELECT COUNT(*) AS discontinued_count
   FROM Product
   WHERE isdiscontinued = 1;
   ```

### Order Analysis

1. **Total Number of Orders**:
   ```sql
   SELECT COUNT(*) AS total_orders
   FROM `Order`;
   ```

2. **Total Sales by Year**:
   ```sql
   SELECT YEAR(order_date) AS order_year, SUM(total_amount) AS total_sales
   FROM `Order`
   GROUP BY YEAR(order_date)
   ORDER BY order_year;
   ```

3. **Average Order Value**:
   ```sql
   SELECT AVG(total_amount) AS average_order_value
   FROM `Order`;
   ```

### OrderItems Analysis

1. **Total Number of Order Items**:
   ```sql
   SELECT COUNT(*) AS total_order_items
   FROM OrderItems;
   ```

2. **Top 5 Products Sold by Quantity**:
   ```sql
   SELECT p.product_name, SUM(oi.quantity) AS total_quantity_sold
   FROM OrderItems oi
   JOIN Product p ON oi.product_id = p.id
   GROUP BY p.product_name
   ORDER BY total_quantity_sold DESC
   LIMIT 5;
   ```

3. **Revenue Generated by Each Product**:
   ```sql
   SELECT p.product_name, SUM(oi.quantity * oi.unit_price) AS total_revenue
   FROM OrderItems oi
   JOIN Product p ON oi.product_id = p.id
   GROUP BY p.product_name
   ORDER BY total_revenue DESC;
   ```

## Business Insights and Recommendations

1. **Supplier Performance**:
   - Focus on maintaining relationships with suppliers providing the most products.
   - Evaluate supplier performance based on delivery times and product quality.
   - Consider diversifying supplier base to mitigate risk.

2. **Customer Segmentation**:
   - Identify and target top customers with personalized marketing strategies.
   - Implement loyalty programs to retain high-value customers.
   - Analyze customer distribution by country to identify potential new markets.

3. **Product Management**:
   - Optimize inventory by closely monitoring stock levels of top-selling and high-margin products.
   - Discontinue or promote slow-moving products to improve overall sales and reduce storage costs.
   - Regularly review product pricing to ensure competitiveness.

4. **Order Processing**:
   - Streamline order processing to reduce lead times and improve customer satisfaction.
   - Implement automated systems to handle high order volumes efficiently.
   - Monitor order values and identify opportunities for upselling or cross-selling.

5. **Sales Analysis**:
   - Analyze sales trends to forecast demand and adjust inventory accordingly.
   - Focus on peak sales periods to maximize revenue.
   - Identify and address any seasonal variations in sales.

This README provides a structured approach to understanding and analyzing the Khalid Sales Data using SQL, enabling data-driven decision-making to enhance business performance.
