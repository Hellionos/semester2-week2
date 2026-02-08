"""
This is where you should write your code and this is what you need to upload to Gradescope for autograding.

You must NOT change the function definitions (names, arguments).

You can run the functions you define in this file by using test.py (python test.py)
Please do not add any additional code underneath these functions.
"""
#Ethan West
#201990893
import sqlite3
#using test sql file to find the right queries

def customer_tickets(conn, customer_id):
    """
    Return a list of tuples:
    (film_title, screen, price)

    Include only tickets purchased by the given customer_id.
    Order results by film title alphabetically.
    """
    query = '''
            SELECT title, screen, price FROM films JOIN screenings ON 
            films.film_id=screenings.film_id JOIN tickets ON 
            screenings.screening_id=tickets.screening_id JOIN customers ON 
            customers.customer_id=tickets.customer_id WHERE customers.customer_id = ?
            ORDER BY title;
            '''
    cursor = conn.execute(query,(customer_id,))
    rows = cursor.fetchall()
    return rows

def screening_sales(conn):
    """
    Return a list of tuples:
    (screening_id, film_title, tickets_sold)

    Include all screenings, even if tickets_sold is 0.
    Order results by tickets_sold descending.
    """
    query = '''
            SELECT screenings.screening_id,title,COUNT(ticket_id) FROM screenings 
            JOIN films ON screenings.film_id=films.film_id LEFT JOIN tickets ON 
            screenings.screening_id=tickets.screening_id GROUP BY screenings.screening_id
            ORDER BY COUNT(ticket_id) DESC;
            '''
    cursor = conn.execute(query)
    rows = cursor.fetchall()
    return rows


def top_customers_by_spend(conn, limit):
    """
    Return a list of tuples:
    (customer_name, total_spent)

    total_spent is the sum of ticket prices per customer.
    Only include customers who have bought at least one ticket.
    Order by total_spent descending.
    Limit the number of rows returned to `limit`.
    """
    query = '''
            SELECT customer_name, SUM(price) FROM customers JOIN tickets ON 
            customers.customer_id=tickets.customer_id GROUP BY customer_name ORDER BY
            SUM(price) DESC LIMIT ?;
            '''
    cursor = conn.execute(query,(limit,))
    rows = cursor.fetchall()
    return rows