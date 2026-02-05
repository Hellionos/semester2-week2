-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 food_delivery.db
-- 2. Load this script: .read testing.sql
-- 3. Exit SQLite: .exit


-- You can use this to test your sql before you write it into your program.

--SELECT COUNT(customer_id) FROM customers;
--SELECT customer_name,signup_date FROM customers WHERE 
--signup_date=(SELECT MAX(signup_date) FROM customers) OR signup_date=(SELECT MIN(signup_date) FROM customers) ORDER BY signup_date ASC;
--SELECT COUNT(*) AS total_orders, ROUND(AVG(order_total),2) AS avg_order_value,
--MAX(order_total) AS highest_order_total, MIN(order_total) AS lowest_order_total FROM orders;
--SELECT COUNT(*) OVER () AS Number_of_Drivers, driver_id, hire_date FROM drivers GROUP BY driver_id;


--## Section 1 - Summaries
--1. Display the total number of customers.
--2. Show the earliest and latest customer signup dates.
--3. Display:
-- total number of orders
-- average order value
-- highest and lowest order totals
--4. Display the total number of drivers and their hire dates.

--## Section 2 - Key Statistics

--SELECT customer_name, COUNT(order_id), SUM(order_total) FROM customers JOIN orders
--ON customers.customer_id=orders.customer_id GROUP BY customer_name;

--5. Orders per customer
-- Customer name
-- Number of orders
-- Total amount spent

--SELECT driver_name, COUNT(delivery_id) FROM drivers JOIN deliveries 
--ON drivers.driver_id=deliveries.driver_id GROUP BY drivers.driver_id;

--6. Driver workload
-- Driver name
-- Number of deliveries completed

--SELECT orders.order_id, customer_name, order_total, delivery_date, driver_name FROM orders
--JOIN deliveries ON orders.order_id=deliveries.order_id JOIN customers ON 
--orders.customer_id=customers.customer_id JOIN drivers ON deliveries.driver_id=drivers.driver_id
--ORDER BY orders.order_id;


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