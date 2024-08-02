CREATE DATABASE Data_Query_Language_Checkpoint

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
	(3, 'Charlie', '789 Elm St'),
	(4, 'Ahmed', 'Tunisia'),
	(5, 'Coulibaly', 'Senegal'),
	(6, 'Hasan', 'Egypt');

SELECT * FROM Customers

-- Inserting values into product table
INSERT INTO Products (ProductID, ProductName, Product_Price)
VALUES
	(1, 'Widget', 10000.00),
	(2, 'Gadget', 20000.00),
	(3, 'Doohickey', 15000.00),
	(4, 'Cookies', 10.00),
	(5, 'Candy', 5.20);

SELECT * FROM Products

-- Inserting values into Orders table
INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, Order_date)
VALUES
	(1, 1, 1, 10, '01-01-2021'),
	(2, 1, 2, 5, '02-01-2021'),
	(3, 2, 1, 3, '03-01-2021'),
	(4, 2, 2, 7, '04-01-2021'),
	(5, 3, 1, 2, '05-01-2021'),
	(6, 3, 3, 3, '06-01-2021'),
	(7, 1, 2, 3, '01-22-2023'),
	(8, 2, 1, 10, '04-14-2021');

SELECT * FROM Customers
SELECT * FROM Products
SELECT * FROM Orders

--Perfrom an INNER JOIN on Customer table
SELECT * FROM Customers
JOIN Orders
ON Orders.CustomerID = Customers.CustomerID

-- Creating an order table with foreign key
CREATE TABLE Orders_1(
	OrderID INT PRIMARY KEY,
	CustomerID INT,
	CustomerName INT,
	CustomerAddress INT,
	ProductID INT,
	ProductName INT,
	Quantity DECIMAL,
	Product_Price DECIMAL,
	OrderDate DATE,
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID));

SELECT * FROM Orders_1

INSERT INTO Orders_1 (OrderID, CustomerID, CustomerName, CustomerAddress, ProductID, ProductName, Quantity, Product_Price, OrderDate)
VALUES
	(1, 1, 'Alice', '123 Main St', 1, 10, '01-01-2021'),
	(2, 1, 2, 5, '02-01-2021'),
	(3, 2, 1, 3, '03-01-2021'),
	(4, 2, 2, 7, '04-01-2021'),
	(5, 3, 1, 2, '05-01-2021'),
	(6, 3, 3, 3, '06-01-2021'),
	(7, 1, 2, 3, '01-22-2023'),
	(8, 2, 1, 10, '04-14-2021');
