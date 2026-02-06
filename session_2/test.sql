
--1. List all **product categories** in the database.  
--2. Count the **total number of customers**.  
--3. Show all **orders for a given customer** (ask for a specific email).  
--4. Display **all products priced below £2**. 

--SELECT category FROM products GROUP BY category;
--SELECT COUNT(customer_id) FROM customers;
--SELECT order_id, status, first_name,last_name,email FROM orders 
--JOIN customers ON orders.customer_id=customers.customer_id ORDER BY customers.customer_id;
--SELECT name,price FROM products WHERE price<2;

--5. Compute **total spent per customer**. Display the top 5 spenders.  
--6. Count **orders per product category** and show these in descending order. Challenge: Plot a bar chart to show this.
--7. Calculate **average number of products per order**.
--8. Summarize **deliveries by status** (`scheduled`, `delivered`, `failed`) and plot a pie chart. 

--SELECT first_name,last_name,SUM(total_amount) FROM orders 
--JOIN customers ON orders.customer_id=customers.customer_id GROUP BY customers.customer_id ORDER BY SUM(total_amount)
--DESC LIMIT 5;

--SELECT COUNT(orders.order_id),category FROM orders LEFT JOIN order_items ON 
--orders.order_id=order_items.order_id LEFT JOIN products ON order_items.product_id=products.product_id
--GROUP BY category;

--SELECT orders.order_id, AVG(count) FROM (SELECT COUNT(products.product_id) AS count FROM products) orders LEFT JOIN order_items ON 
--orders.order_id=order_items.order_id LEFT JOIN products ON 
--order_items.product_id=products.product_id GROUP BY orders.order_id

---------SELECT orders.order_id,AVG(count) FROM (SELECT COUNT(products.product_id) AS count, orders.order_id
--FROM products JOIN order_items ON order_items.product_id=products.product_id JOIN
--orders ON orders.order_id=order_items.order_id) JOIN order_items ON order_items.product_id=products.product_id
--JOIN orders ON orders.order_id=order_items.order_id;


