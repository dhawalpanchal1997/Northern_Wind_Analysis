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
         ```sql
               SELECT OrderID
               FROM Orders as O
               JOIN Customers as C ON O.CustomerID = C.CustomerID
               WHERE C.CompanyName = 'Island Trading'
      
               SELECT OrderID
               FROM Orders 
               WHERE CustomerID IN (SELECT CustomerID FROM Customers WHERE CompanyName = 'Island Trading')
         ```
* **Total Sales of Products Sold Fewer Than 100 Times:**
    * Lists product ID, product name, and total number sold for products sold fewer than 100 times, using a join and aggregation.
      ```sql
               SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS Total_no_sold 
               FROM Products as p
               JOIN [Order Details] as od ON p.ProductID = od.ProductID
               GROUP BY p.ProductID, p.ProductName
               HAVING SUM(od.Quantity) < 100
      ```
* **Employees Who Sold to 'Island Trading':**
    * Fetches the last name and first name of employees who sold to 'Island Trading', using both a join and nested subquery for distinct results.
       ```sql
               SELECT DISTINCT e.LastName ,e.FirstName
               FROM Employees as e
               JOIN Orders as o ON e.EmployeeID = o.EmployeeID
               JOIN Customers as c ON o.CustomerID = c.CustomerID
               WHERE c.CompanyName = 'Island Trading'
        ```       
* **Employees Without Orders Between March 1 and March 7, 1997:**
    * Uses both outer join and subquery methods to list employees who did not take any orders during this date range.
       ```sql
               SELECT  DISTINCT e.EmployeeID, e.LastName, e.FirstName
               FROM Employees e 
               LEFT JOIN Orders O ON e.EmployeeID = o.EmployeeID
               							AND o.OrderDate BETWEEN '3/1/1997' AND '3/7/1997'
               WHERE o.OrderID IS NULL

      ```
* **Customers and Suppliers of 'Tofu' Product:**
    * Uses UNION to combine distinct results from customers and suppliers who ordered/supplied the product 'Tofu'. 
       ```sql
               SELECT DISTINCT C.CompanyName, C.ContactName, C.City, C.Region, C.PostalCode, C.Country, C.Phone
               FROM Customers C
               JOIN Orders O ON C.CustomerID = O.CustomerID
               JOIN [Order Details] od ON O.OrderID = od.OrderID
               JOIN Products p ON od.ProductID = p.ProductID
               WHERE p.ProductName = 'Tofu'
               UNION
               SELECT DISTINCT S.CompanyName, S.ContactName, S.City, S.Region, S.PostalCode, S.Country, S.Phone
               FROM Suppliers S 
               JOIN Products p ON s.SupplierID = p.SupplierID
               WHERE p.ProductName = 'Tofu'
        ```       
The Northwind database provides a valuable resource for learning and experimenting with database concepts in a real-world context.
