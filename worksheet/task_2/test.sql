--Write a function that returns details of tickets purchased by a specific customer.

--The function should return a list of tuples containing (in order):
-- the film title
-- the screen
-- the ticket price

--Results should be ordered alphabetically by film title.


--SELECT title, screen, price FROM films JOIN screenings ON films.film_id=screenings.film_id
--JOIN tickets ON screenings.screening_id=tickets.screening_id GROUP BY title ORDER BY title;
--group by might be optional

--Write a function that returns the customers who have spent the most money on tickets.

--The function should return a list of tuples containing (in order):
-- the customer name
-- the total amount spent on tickets

--Only customers who have purchased at least one ticket should be included.

--Results should be ordered by total amount spent, from highest to lowest, and limited 
--to a specified number of rows (passed in by the argument `limit`)

SELECT customer_name, SUM(price) FROM customers JOIN tickets ON customers.customer_id=tickets.customer_id
GROUP BY customer_name ORDER BY SUM(price) DESC LIMIT ?;