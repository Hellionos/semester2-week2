-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 food_delivery.db
-- 2. Load this script: .read testing.sql
-- 3. Exit SQLite: .exit


-- You can use this to test your sql before you write it into your program.

SELECT COUNT(customer_id) FROM customers;

--## Section 1 - Summaries

--1. Display the total number of customers.
--2. Show the earliest and latest customer signup dates.
--3. Display:
-- total number of orders
-- average order value
-- highest and lowest order totals
--4. Display the total number of drivers and their hire dates.

--## Section 2 - Key Statistics

--5. Orders per customer
-- Customer name
-- Number of orders
-- Total amount spent


--6. Driver workload
-- Driver name
-- Number of deliveries completed


--7. Order delivery Lookup - search for an individual order
-- search for an order by ID
-- customer name
-- order total
-- delivery date
-- driver

--## Section 3 - Time-based Summaries

--8. Count the number of orders per order date.
--9. Count the number of deliveries per delivery date.
--10. Count customer signups per month - you may need to do some python processing on this one!

--## Section 4 - Performance and Rankings

--11. List the top 5 customers by total spend.
--12. Rank drivers by number of deliveries completed.
--13. Display all orders above a value which should be inputted by the user (e.g. £100)