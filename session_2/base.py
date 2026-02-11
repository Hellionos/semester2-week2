import sqlite3
# you will need to pip install pandas matplotlib - done
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt

def get_connection(db_path="orders.db"):
    """
    Establish a connection to the SQLite database.
    Returns a connection object.
    """
    conn = sqlite3.connect(db_path)
    conn.row_factory = sqlite3.Row
    return conn

def main(conn):

    
    while True:
        print("\n===Supermarket Data Viewing and Processing===")
        print("1. Section 1 : Warm-up")
        print("2. Section 2 : Basic Analytics")
        print("3. Section 3 : Intermediate / Advanced")
        print("4. Section 4 : Stretch / Challenge")
        print("0. Exit")

        choice = input("Select an option: ")
        if choice == "1":
            section_1_menu(conn)
        elif choice == "2":
            section_2_menu(conn)
        elif choice == "3":
            section_3_menu(conn)
        elif choice == "4":
                        section_4_menu(conn)
        elif choice == "0":
            print("Exiting dashboard.")
            break
        else:
            print("Invalid option. Please try again.")

def section_1_menu(conn):
    while True:
        print("\nSection 1 : Warm-up")
        print("1. List all **product categories** in the database")
        print("2. Count the **total number of customers**")
        print("3. Show all **orders for a given customer** (ask for a specific email)")
        print("4. Display **all products priced below £2**")
        print("0. Back to main menu")

        choice = input("Select an option: ")

        if choice == "1":
            all_product_categories(conn)
        elif choice == "2":
            number_of_customers(conn)
        elif choice == "3":
            orders_of_a_customer(conn)
        elif choice == "4":
            products_less_than_2(conn)
        elif choice == "0":
            break
        else:
            print("Invalid option. Please try again.")

def section_2_menu(conn):
    while True:
        print("\nSection 2 : Basic Analytics")
        print("1. **total spent per customer**")
        print("2. **orders per product category**")
        print("3. **average number of products per order**")
        print("4. **deliveries by status**")
        print("0. Back to main menu")

        choice = input("Select an option: ")

        if choice == "1":
            total_spent_per_customer(conn)
        elif choice == "2":
            order_per_product_category(conn)
        elif choice == "3":
            print("temp")
        elif choice == "4":
            print("temp")
        elif choice == "0":
            break
        else:
            print("Invalid option. Please try again.")

def all_product_categories(conn):
    query = '''
        SELECT category FROM products GROUP BY category;
        '''
    cursor = conn.execute(query)
    print("\n")
    for each in cursor:
        print(f"Categories: {each[0]}")

def number_of_customers(conn):
    query = '''
        SELECT COUNT(customer_id) FROM customers;
        '''
    cursor = conn.execute(query)
    print("\n")
    for each in cursor:
        print(f"Number of customers: {each[0]}")

def orders_of_a_customer(conn):
    choice = input("Enter customer email: ")
    query = '''
        SELECT first_name,last_name,email,order_id, status FROM orders 
        JOIN customers ON orders.customer_id=customers.customer_id ORDER BY customers.customer_id;
        '''
    cursor = conn.execute(query, (choice,))
    customer= cursor.fetchone()
    if customer:
        print(f"Name: {customer[0]} {customer[1]}, Email: {customer[2]}, Order: {customer[3]},{customer[4]}")
    else:
        print("Customer not found")

def products_less_than_2(conn):
    query = '''
        SELECT name,price FROM products WHERE price<2 ORDER BY price;
        '''
    cursor = conn.execute(query)
    print("\n")
    for each in cursor:
        print(f"Product: {each[0]}, Price: {each[1]}")

def total_spent_per_customer(conn):
    query = '''
        SELECT first_name,last_name,SUM(total_amount) FROM orders 
        JOIN customers ON orders.customer_id=customers.customer_id GROUP BY customers.customer_id 
        ORDER BY SUM(total_amount) DESC LIMIT 5
       '''
    cursor = conn.execute(query)
    print("\n")
    for each in cursor:
        print(f"Name: {each[0]} {each[1]}, Amount: £{each[2]}")

def order_per_product_category(conn):
    query = '''
        SELECT category,COUNT(orders.order_id) FROM orders LEFT JOIN order_items ON 
        orders.order_id=order_items.order_id LEFT JOIN products ON 
        order_items.product_id=products.product_id GROUP BY category ORDER BY COUNT(orders.order_id) DESC;
        '''
    cursor = conn.execute(query)
    print("\n")
    for each in cursor:
        print(f"Category: {each[0]}, Number of Orders: {each[1]}")
    df = pd.read_sql(query, conn)
    plt.figure(figsize=(10, 6))
    plt.bar(df["category"], df["COUNT(orders.order_id)"], color="#4C78A8")
    plt.title("Orders per Product Category")
    plt.xlabel("Category")
    plt.ylabel("Number of Orders")
    plt.xticks(rotation=45, ha="right")
    plt.tight_layout()
    plt.show()

        
        
if __name__=="__main__":
    conn = get_connection()
    main(conn)
    conn.close()
'''
1. Connect to the SQLite database using Python:  
   ```python
   import sqlite3
   import pandas as pd

   conn = sqlite3.connect("delivery_demo_light.db")
   ```
2. Use SQL queries via `conn.execute()` to fetch data.
3. Visualise results using **pandas or matplotlib** where needed.
4. You should build a set of **functions** so that you have a record of each task.
'''