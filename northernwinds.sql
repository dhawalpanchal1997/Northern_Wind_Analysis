--1.	[Northwind]  List all order ID's for customer 'Island Trading'.  Use a join.

SELECT OrderID
FROM Orders as O
JOIN Customers as C ON O.CustomerID = C.CustomerID
WHERE C.CompanyName = 'Island Trading'

--2.	[Northwind]  List all order ID's for customer 'Island Trading'.  Use a subquery.

SELECT OrderID
FROM Orders 
WHERE CustomerID IN (SELECT CustomerID FROM Customers WHERE CompanyName = 'Island Trading')

--3.	[Northwind]  List the product ID, product name, and total number sold of all products that have sold fewer than 100, when all sales are taken into account.  Use a join.

SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS Total_no_sold 
FROM Products as p
JOIN [Order Details] as od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING SUM(od.Quantity) < 100

--4.	[Northwind]  List the last name and first name of all employees who have sold to 'Island Trading'.  List each name just once.  Use a join.

SELECT DISTINCT e.LastName ,e.FirstName
FROM Employees as e
JOIN Orders as o ON e.EmployeeID = o.EmployeeID
JOIN Customers as c ON o.CustomerID = c.CustomerID
WHERE c.CompanyName = 'Island Trading'

--5.	[Northwind]  List the last name and first name of all employees who have sold to 'Island Trading'.  Use a nested subquery.

SELECT LastName, FirstName
FROM Employees
WHERE EmployeeID IN (SELECT EmployeeID FROM Orders WHERE CustomerID IN (SELECT CustomerID FROM Customers WHERE CompanyName = 'Island Trading'))

--6.	[Northwind]  List the EmployeeID, LastName, and FirstName of all employees who did not take an order between March 1 and March 7, 1997.  Use an outer join.  (Hint:  You must include the condition on OrderDate in the ON clause of the outer join.)

SELECT  DISTINCT e.EmployeeID, e.LastName, e.FirstName
FROM Employees e 
LEFT JOIN Orders O ON e.EmployeeID = o.EmployeeID
							AND o.OrderDate BETWEEN '3/1/1997' AND '3/7/1997'
WHERE o.OrderID IS NULL

--7.	[Northwind]  List the EmployeeID, LastName, and FirstName of all employees who did not take an order between March 1 and March 7, 1997.  Use a subquery.

SELECT EmployeeID, LastName, FirstName
FROM employees 
WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Orders WHERE OrderDate BETWEEN '3/1/1997' AND '3/7/1997')

--8.	[Northwind]  List the CompanyName, ContactName, City, Region, PostalCode, Country, and Phone of all Customers who have ordered product 'Tofu' and of the Supplier of that product.  Use UNION.  Show all output rows.

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
