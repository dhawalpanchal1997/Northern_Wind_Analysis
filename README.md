# Northwind Database

The Northwind database is a sample database originally created by Microsoft for database tutorials. It simulates the sales data for "Northwind Traders," a company that imports and exports specialty foods worldwide. 

**Key Features:**

* **Comprehensive:** Covers core business areas like customers, orders, inventory, suppliers, employees, and shipping.
* **Tutorial-Oriented:** Designed to teach database concepts, SQL querying, and data analysis.
* **Platform Agnostic:** Available on various databases, including Microsoft SQL Server and PostgreSQL.

**Included Data:**

* **Suppliers:** Information about vendors and suppliers.
* **Customers:** Details of customers who purchase from Northwind Traders.
* **Employees:** Information about Northwind Traders' employees.
* **Products:** Product details, including names, descriptions, and prices.
* **Shippers:** Information about the shipping companies used by Northwind Traders.
* **Orders:** Sales order transactions, including customer, date, and order details.
* **Order Details:** Specifics of each order, such as product, quantity, and unit price.

**Structure:**

The Northwind database consists of 14 tables with well-defined relationships, often visualized using an Entity-Relationship Diagram (ERD).
![ERD](northwind-er-diagram.png)

**Uses:**

* **Learning SQL:** Excellent for practicing SQL queries (SELECT, JOIN, WHERE, etc.).
* **Database Design:** Demonstrates database design principles and normalization.
* **Data Analysis:** Enables practice in analyzing sales data, customer behavior, and product performance.

**Project Content:**

This SQL file includes a set of queries designed to retrieve specific data from the Northwind database. The focus is on operations involving customers, orders, products, and employees, leveraging joins, subqueries, and filtering to extract relevant information.

* **List Order IDs for 'Island Trading':**
    * Retrieves all order IDs for the customer 'Island Trading' using both a join and subquery method.

* **Total Sales of Products Sold Fewer Than 100 Times:**
    * Lists product ID, product name, and total number sold for products sold fewer than 100 times, using a join and aggregation.

* **Employees Who Sold to 'Island Trading':**
    * Fetches the last name and first name of employees who sold to 'Island Trading', using both a join and nested subquery for distinct results.

* **Employees Without Orders Between March 1 and March 7, 1997:**
    * Uses both outer join and subquery methods to list employees who did not take any orders during this date range.

* **Customers and Suppliers of 'Tofu' Product:**
    * Uses UNION to combine distinct results from customers and suppliers who ordered/supplied the product 'Tofu'. 

The Northwind database provides a valuable resource for learning and experimenting with database concepts in a real-world context.
