--Creating Database
CREATE DATABASE Data_definition_language_Checkpoint

-- Creating table for Customer
CREATE TABLE Customers (
	CustomerID INT NOT NULL PRIMARY KEY,
	CustomerName VARCHAR(100) NOT NULL,
	CustomerAddress VARCHAR(100) NOT NULL);

-- Creating table for Product
CREATE TABLE Products (
	ProductID INT NOT NULL PRIMARY KEY,
	ProductName VARCHAR(100) NOT NULL,
	Product_Price DECIMAL(10, 2) NOT NULL);


-- Creating table for Order
CREATE TABLE Orders (
	OrderID INT NOT NULL PRIMARY KEY,
	CustomerID VARCHAR(100) NOT NULL,
	ProductID VARCHAR(100) NOT NULL,
	Quantity DECIMAL(10, 2) NOT NULL,
	Order_date DATE NOT NULL);

--Inserting values into Customer table
INSERT INTO Customers (CustomerID, CustomerName, CustomerAddress)
VALUES
	(1, 'Alice', '123 Main St'),
	(2, 'Bob', '456 Market St'),
	(3, 'Charlie', '789 Elm St');

SELECT * FROM Customers

-- Inserting values into product table
INSERT INTO Products (ProductID, ProductName, Product_Price)
VALUES
	(1, 'Widget', 10000.00),
	(2, 'Gadget', 20000.00),
	(3, 'Doohickey', 15000.00);

SELECT * FROM Products

-- Inserting values into Orders table
INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, Order_date)
VALUES
	(1, 1, 1, 10, '01-01-2021'),
	(2, 1, 2, 5, '02-01-2021'),
	(3, 2, 1, 3, '03-01-2021'),
	(4, 2, 2, 7, '04-01-2021'),
	(5, 3, 1, 2, '05-01-2021'),
	(6, 3, 3, 3, '06-01-2021');

SELECT * FROM Customers
SELECT * FROM Products
SELECT * FROM Orders

--Inserting values into Customer table
INSERT INTO Customers (CustomerID, CustomerName, CustomerAddress)
VALUES
	(4, 'Ahmed', 'Tunisia'),
	(5, 'Coulibaly', 'Senegal'),
	(6, 'Hasan', 'Egypt');

SELECT * FROM Customers

-- Inserting values into product table
INSERT INTO Products (ProductID, ProductName, Product_Price)
VALUES
	(4, 'Cookies', 10.00),
	(5, 'Candy', 5.20);

SELECT * FROM Products

-- Inserting values into Orders table
INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, Order_date)
VALUES
	(7, 1, 2, 3, '01-22-2023'),
	(8, 2, 1, 10, '04-14-2021');

SELECT * FROM Orders

-- Updating the quantity of the 2nd order
UPDATE Orders
SET Quantity = 6
WHERE OrderID = 2;

SELECT * FROM Orders

-- Deleting customer 3 from the customer table
DELETE FROM Customers WHERE CustomerID = 3
	
SELECT * FROM Customers

-- Deleting the content of order table
TRUNCATE TABLE Orders

-- Deleting the order table
DROP TABLE Orders


