CREATE DATABASE Gomycode_1;

USE Gomycode_1

CREATE TABLE Employees(
	EmployeeID INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Department VARCHAR(50),
	Salary DECIMAL(10, 2));

	-- Inserting values into Employees's table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary)
VALUES (1, 'John', 'Doe', 'HR', 55000.00),
	  (2, 'Jane', 'Smith', 'Marketing', 60000.00),
	  (3, 'Bob', 'Johnson', 'IT', 65000.00);


	  -- Retrieving all information from the table
SELECT * FROM Employees;

	  -- Retrieving the information for HR department
SELECT * FROM Employees WHERE Department = 'HR'

-- Retrieving the information where salary is greater than 60000.00
SELECT * FROM Employees WHERE Salary > 60000
SELECT * FROM Employees WHERE Salary > 45000

-- Update the salary of employer with ID 1
UPDATE Employees
SET Salary = 58000.00
WHERE EmployeeID = 1;

-- Deleting record from table
DELETE FROM Employees
WHERE EmployeeID = 3;

SELECT TOP 2 * FROM Employees

-- To view the structure of your table
SP_HELP Employees

-- ALTER TABLE Employees ATLTER COLUMN
SP_RENAME 'Employees.FirstName', 'firstname';

select * from Employees

-- Adding a new column to the table
ALTER TABLE Employees ADD Age INT


UPDATE Employees
SET Age = 25
WHERE EmployeeID = 1;
UPDATE Employees
SET Age = 30
WHERE EmployeeID = 2;

-- Deleting a column for the table
ALTER TABLE Employees DROP COLUMN Age;

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary)
VALUES (4, 'Emmanuel', 'Okoye', 'HR', 85000.00),
	  (5, 'Vincent', 'Chief', 'Marketing', 50000.00),
	  (6, 'Chaviva', 'Otabor', 'IT', 45000.00);

SELECT * From Employees

-- The Truncate command will remove all the record in the table, but the structure (column) will remain
TRUNCATE TABLE Employees

-- To parmanently delete a Table
DROP TABLE Employees

-- Join Command joins two or more tables together
CREATE TABLE Departments(
		DepartmentID INT PRIMARY KEY,
		DepartmentName VARCHAR(50));

		--Insert data into Departments table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
		(1, 'HR'),
		(2, 'Marketing'),
		(3, 'IT');

SELECT * FROM Departments
SELECT * FROM Employees

--Perfrom an INNER JOIN to retrieve employees with Department Names
SELECT * FROM Employees
JOIN Departments
ON Departments.DepartmentName = Employees.Department

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
		(4, 'Software Engineering'),
		(5, 'Data Analystics'),
		(6, 'Project Management'); 

-- Using Left join on the tables
SELECT * FROM Employees
LEFT JOIN Departments
ON Employees.Department = Departments.DepartmentName

--Using Right join on tables
SELECT * FROM Departments
LEFT JOIN Employees
ON Departments.DepartmentName = Employees.Department

-- Aggregate Functions (These funtions summerizes the value of the column/columns they are applied on)
-- Calculate the avaerage salary of employees in the IT Department
SELECT AVG(Salary) FROM Employees
	WHERE Department = 'IT'

			OR

SELECT COUNT(Salary) AS Minimum_IT_salary FROM Employees
	WHERE Department = 'IT'

-- Subqueries (Also called nested quueries, are queries that are executed inside another query)
SELECT EmployeeID, FirstName, LastName, Salary
FROM Employees WHERE
Salary > (SELECT AVG(Salary) FROM Employees)

-- CONSTRAINTS
-- Creating a table with a Primary key constraint
CREATE TABLE Employees_1(
	EmployeeID INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50));

	DROP TABLE Employees_1

CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50));

-- Creating an order table with foreign key
CREATE TABLE Orders(
	OrderID INT PRIMARY KEY,
	CustomerID INT,
	OrderDate DATE,
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));

-- Creating a table with a unique  contraints
CREATE TABLE Products(
	ProductID INT UNIQUE NOT NULL,
	ProductName VARCHAR (100)
	);

SP_HELP Products
SELECT * FROM Orders

-- Creating a student table with a check constraint
CREATE TABLE Students (
	StudentID INT PRIMARY KEY,
	Age INT,
	CHECK (Age >= 18) -- Ensures students are 18 oe above
	);

-- Creating a table with default constaint
CREATE TABLE Addresses (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Street_Address VARCHAR (255),
	City VARCHAR(100),
	States VARCHAR (50),
	Zipcode Varchar (10)
	);

	-- Adding a new column to the table order
ALTER TABLE Orders  
 ADD Dates DATE DEFAULT GETDATE()
 SELECT * FROM Orders

 INSERT INTO Orders (OrderID, CustomerID, OrderDate)
 VALUES(001, 1, '12-02-2024');

INSERT INTO Customers (CustomerID, FirstName, LastName)
VALUES (1, 'Richie', 'Bob');

-- Logical Operators
-- AND
SELECT * FROM Employees
WHERE Salary >= 40000 AND Department = 'IT'

SELECT * FROM house_pricing_dataset

SELECT * FROM house_pricing_dataset
WHERE Price <= 20000 AND City = 'Seattle'

SELECT ROUND(AVG(Price), 2) AS AVG_price FROM house_pricing_dataset

-- Example of the NOT Opreration
SELECT * FROM house_pricing_dataset
WHERE NOT City = 'Seattle' AND Price <= 200000 


-- Using the IN key word
SELECT * FROM house_pricing_dataset
	WHERE city IN ('Seattle', 'Kent', 'Lake Forest Park');

SELECT ROUND (AVG (price), 2) AS AVG_PRICE FROM house_pricing_dataset
	WHERE city IN ('Seattle', 'Kent', 'Lake Forest Park');

-- Selecting the Unique cities in our dataset (selecting all the cities in the dataset)
SELECT DISTINCT (city) FROM house_pricing_dataset
	WHERE price <= 200000

-- Example of the Between Operator (Selecting house prices between a range)
SELECT * FROM house_pricing_dataset
WHERE city IN ('Seattle', 'Kent') AND DATE BETWEEN '2014-05-02' AND ('2014-10-10');

SELECT * FROM house_pricing_dataset
WHERE city IN ('Seattle', 'Kent') AND bedrooms BETWEEN ('4') AND ('10');

-- Using the LIKE keyword/clause
SELECT * FROM house_pricing_dataset
	WHERE city LIKE 'S%' AND price > 2000000

SELECT city, MAX(price) AS Max_price FROM house_pricing_dataset
	WHERE city LIKE 'S%'
	GROUP BY city
	ORDER BY Max_price DESC;

-- Using the CASE keyword/clause
SELECT city, price, bedrooms, waterfront,
	CASE
	WHEN price <= 200000 THEN 'Low cost house'
	WHEN price >= 200000 AND price < 1000000 THEN'Average cost house'
	WHEN price >= 1000000 THEN 'High cost house'
	END Category_of_houses
FROM house_pricing_dataset
GROUP BY city, price, bedrooms, waterfront
ORDER BY price DESC;

SELECT DISTINCT(price) FROM house_pricing_dataset

SELECT city, price, bedrooms, waterfront,
	CASE
	WHEN waterfront = 1 THEN 'Waterfront Available'
	WHEN waterfront = 0 THEN 'No Waterfront Available'
	END AS Water_front
FROM house_pricing_dataset

SELECT * FROM house_pricing_dataset
WHERE waterfront = 1

SELECT DISTINCT(bedrooms) FROM house_pricing_dataset
WHERE bedrooms = 4

SELECT * FROM Employees

-- This command will remove the values in the rows leaving the columns or structure of table
TRUNCATE TABLE Employees

--Using Advance usage of CASE statement
UPDATE Employees
SET Salary = 
	CASE
		WHEN Department = 'IT' THEN Salary * 1.1
		WHEN Department = 'Marketing' THEN Salary * 1.15
		ELSE Salary
END 

-- Using GROUP BY function in SQL
SELECT TOP 2 * FROM house_pricing_dataset
SELECT DISTINCT([view]) FROM house_pricing_dataset

--How many houses have view
SELECT [view], COUNT(*) AS Numbers_of_view FROM house_pricing_dataset
WHERE [view] >= 0
GROUP BY [view]
ORDER BY Numbers_of_view DESC;

SELECT * FROM house_pricing_dataset
WHERE city = ('Seattle') AND price >= 200000 AND bedrooms >= 2 AND floors >= 1 

SELECT * FROM house_pricing_dataset
WHERE city IN ('Seattle', 'Redmond') AND price >= 200000 AND bedrooms >= 2 AND floors >= 1 

-- Group cities according to year renovated
SELECT DISTINCT(yr_renovated) FROM house_pricing_dataset

SELECT * FROM house_pricing_dataset
SELECT city, yr_renovated, COUNT(*) FROM house_pricing_dataset
WHERE yr_renovated > 0
GROUP BY city, yr_renovated 
ORDER BY yr_renovated DESC;

SELECT city, yr_renovated FROM house_pricing_dataset
GROUP BY city, yr_renovated
ORDER BY yr_renovated DESC;

-- Using the Having Clause
SELECT AVG(price) AS AVG_Price, [view] FROM house_pricing_dataset
	GROUP BY [view]
	HAVING [view] > 3;


INSERT INTO Customers(CustomerID, FirstName, LastName)
VALUES 
	(2, 'Dimeji', 'Saliu'),
	(3, 'Olatunde', 'Borokinni'),
	(4, 'Emmanuel', 'Okoye');

INSERT INTO Orders(OrderID, CustomerID, OrderDate)
VALUES 
	(002, 2, '12-03-2024'),
	(003, 3, '12-04-2024'),
	(004, 4, '12-05-2024');

SELECT * FROM Orders

INSERT INTO Products(ProductID, ProductName)
VALUES
	(1, 'Sneakers'),
	(2, 'Make-up'),
	(3, 'Bracelet'),
	(4, 'Wristwatch');

ALTER TABLE Tablename ALTER COLUMN Columnname New_Clumn VACHAR(100)

-- SETs Operator
SELECT CustomerID FROM Customers
INTERSECT 
SELECT CustomerID FROM Orders
INTERSECT
SELECT ProductID FROM Products

SELECT FirstName from Employees
UNION
SELECT FirstName FROM Customers

SELECT FirstName FROM Employees
EXCEPT
SELECT FirstName FROM Customers

SELECT * FROM SampleSuperstore

SELECT DISTINCT(STATE) FROM SampleSuperstore

SELECT Category FROM SampleSuperstore
WHERE Category = 'Funiture'


SELECT City, COUNT(City) City_count FROM SampleSuperstore
Where Quantity >= 2 AND Category = 'Furniture'
GROUP BY City
ORDER BY City_count DESC

SELECT * FROM SampleSuperstore
WHERE Category = 'Furniture' AND Quantity >= 2


SELECT Segment, Region, Sales FROM SampleSuperstore

SELECT Region, ROUND (SUM(Sales), 2) Total_sales FROM SampleSuperstore
WHERE Segment = 'Consumer'
GROUP BY Region
ORDER BY Total_sales DESC




