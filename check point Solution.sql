CREATE DATABASE ASSIGNMENT

--CREATING TABLE FOR CUSTOMER
CREATE TABLE Customers(
             CustomerID INT NOT NULL PRIMARY KEY ,
             CustomerName VARCHAR (100) NOT NULL,
             CustomerTel DECIMAL (20)  NOT NULL);

--INSERTING INTO TABLE FOR CUSTOMER
INSERT INTO Customers(CustomerID, CustomerName, CustomerTel)
VALUES 
	(1,'Alice',08145090382),
	(2,'Bob', 08035090621),
	(3,'Charlie', 08063064823);

			  
--CREATING TABLE FOR PRODUCTS 
CREATE TABLE Products(
             ProductID INT NOT NULL PRIMARY KEY,
             ProductName VARCHAR (100) NOT NULL,
			 Category VARCHAR(100)NOT NULL,
             ProductPrice Decimal (10,2) NOT NULL);
			 
--INSERTING INTO TABLE FOR PRODUCTS
INSERT INTO Products (ProductID, ProductName, Category, ProductPrice)
VALUES 
	(1,'Widget','Appliances', 10.00),
	(2, 'Gadget', 'Appliances',20.00),
	(3, 'Doohickey', 'Appliances', 15.00);

CREATE TABLE Orders (
					OrderID INT NOT NULL PRIMARY KEY,
                    CustomerID INT NOT NULL,
                    ProductID INT NOT NULL,
                    OrderDate DATE NOT NULL,
                    Quantity INT NOT NULL);
                    


					
--INSERTING INTO TABLE FOR Orders
 INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity)
          VALUES
				(1,'001','1','2021-01-01','10'),
		        (2,'001','2','2021-01-02','5'),
				(3,'002','1','2021-01-03','3'),
				(4,'002','2','2021-01-04','7'),
				(5,'003','1','2021-01-05','2'),
				(6,'003','3','2021-01-06','3');

SELECT * FROM Customers
SELECT * FROM Products
SELECT * FROM Orders

---QUESTION NUMBER 3

	SELECT Customers.CustomerName, Products.ProductPrice * Orders.Quantity AS Total_Cost
	from Customers
	JOIN Orders
	ON Customers.CustomerID = Orders.CustomerID
	JOIN Products
	ON Orders.ProductID = Products.ProductID
	WHERE Products.category IN ('Widget','Gadget') AND Orders.Quantity >=1;
	
--QUESTION NUMBER 4
	SELECT
    Customers.CustomerName,
    SUM(Orders.Quantity * Products.ProductPrice) AS total_cost
FROM
    Customers
JOIN
    Orders  ON Customers.CustomerID = Orders.CustomerID
JOIN
    Products  ON Orders.ProductID = Products.ProductID
WHERE
    Products.ProductName = 'Widget'
GROUP BY
    Customers.CustomerName

HAVING 
     SUM(Orders.Quantity) >= 1;


---QUESTION 5

	SELECT
    Customers.CustomerName,
    SUM(Orders.Quantity * Products.ProductPrice) AS Total_Cost
FROM
    Customers 
JOIN
    Orders  ON Customers.CustomerID = Orders.CustomerID
JOIN
    Products  ON Orders.ProductID = Products.ProductID
WHERE
    Products.ProductName = 'Gadget'
GROUP BY
    CustomerS.CustomerName
HAVING
    SUM(Orders.Quantity) >= 1;


--QUESTION 6
SELECT
    Customers.CustomerName,
    SUM(Orders.Quantity * Products.ProductPrice) AS Total_Cost
FROM
    Customers 
JOIN
    Orders  ON Customers.CustomerID = Orders.CustomerID
JOIN
    Products  ON Orders.ProductID = Products.ProductID
WHERE
    Products.ProductName = 'Doohickey'
GROUP BY
    Customers.CustomerName
HAVING
    SUM(Orders.Quantity) >= 1;

--QUESTION 7

SELECT
    Customers.CustomerName,
    SUM(CASE WHEN Products.ProductName = 'Widget' THEN Orders.Quantity ELSE 0 END) AS Total_widgets,
    SUM(CASE WHEN Products.ProductName = 'Gadget' THEN Orders.Quantity ELSE 0 END) AS Total_Gadgets,
    SUM(Orders.Quantity * Products.ProductPrice) AS total_cost
FROM
    Customers
JOIN
    Orders  ON Customers.CustomerID = Orders.CustomerID
JOIN
    Products ON Orders.ProductID = Products.ProductID
WHERE
    Products.ProductName IN ('Widget', 'Gadget')
GROUP BY
    Customers.CustomerName;

----QUESTION 8
SELECT
    Products.ProductName,
    SUM(Orders.Quantity) AS Total_Quantity_Ordered
FROM
    Products 
JOIN
    Orders  ON Products.ProductID = Orders.ProductID
GROUP BY
    Products.ProductName
HAVING
    SUM(Orders.Quantity) >= 1;

--QUESTION 9
   SELECT
    Products.ProductName,
    SUM(Orders.Quantity) AS Total_Quantity_Ordered
FROM
    Products 
JOIN
    Orders  ON Products.ProductID = Orders.ProductID
GROUP BY
    Products.ProductName
HAVING
    SUM(Orders.Quantity) >= 1;

--QUESTION 10
SELECT
    Products.ProductName,
    SUM(Orders.Quantity) AS total_quantity_ordered
FROM
    Products 
JOIN
    Orders  ON Products.ProductID = Orders.ProductID
GROUP BY
    Products.ProductName
ORDER BY
    Total_Quantity_Ordered DESC;

--QUESTION 11

SELECT
    Customers.CustomerName,
    COUNT(DISTINCT Orders.OrderDate) AS Total_Days_Ordered
FROM
    Customers 
JOIN
    Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY
    Customers.CustomerName
HAVING
    COUNT(DISTINCT Orders.OrderDate) = 7;

--QUESTION 1
CREATE TABLE Wine (
		NumberWine INT PRIMARY KEY NOT NULL,
		Category VARCHAR(100),
		YEAR VARCHAR(50),
		Degree DECIMAL (10, 2)
		);

CREATE TABLE Harvest (
		Numberwine INT PRIMARY KEY NOT NULL,
		Quantity INT);

CREATE TABLE Producer(
		NumberProducer INT PRIMARY KEY NOT NULL,
		NumberWine INT,
		FirstName VARCHAR(200),
		LastName VARCHAR(200),
		Region VARCHAR(150)
		);

--QUESTION 3
INSERT INTO Wine (NumberWine, Category, YEAR, Degree)
	VALUES(1, 'Non-Alcoholic', 2023, 0.0),
		  (2, 'Alcoholic', '1996', 15.7),
		  (3, 'Alcoholic', '1992', 20.0),
		  (4, 'Alcoholic', '1990', 40.0),
		  (5, 'Non-Alcoholic', '1986', 30.00),
		  (6, 'Alcoholic', '1998', 10.28),
		  (7, 'Non-Alcoholic', '2021', 0.0),
		  (8, 'Alcoholic', '2015', 6.55),
		  (9, 'Alcoholic', '2018', 5.25),
		  (10, 'Non-Alcoholic', '2022', 0.0),
		  (11, 'Non-Alcoholic', '2024', 0.0),
		  (12, 'Alcoholic', '2019', 12.0),
		  (13, 'Alcoholic', '2012', 38.00),
		  (14, 'Non-Alcoholic', '2023', 0.0),
		  (15, 'Alcoholic', '1995', 15.7),
		  (16, 'Alcoholic', '1993', 20.0),
		  (17, 'Alcoholic', '1999', 40.0),
		  (18, 'Non-Alcoholic', '1986', 30.00),
		  (19, 'Alcoholic', '1998', 10.28),
		  (20, 'Non-Alcoholic', '2021', 0.0),
		  (21, 'Alcoholic', '2015', 6.55),
		  (22, 'Alcoholic', '2018', 5.25),
		  (23, 'Non-Alcoholic', '2002', 0.0),
		  (24, 'Non-Alcoholic', '2014', 0.0),
		  (25, 'Alcoholic', '2019', 12.0),
		  (26, 'Alcoholic', '2012', 38.00),
		  (27, 'Non-Alcoholic', '2018', 0.0),
		  (28, 'Alcoholic', '1996', 15.7),
		  (29, 'Alcoholic', '1982', 20.0),
		  (30, 'Alcoholic', '1990', 40.0);
		  
		 

INSERT INTO Harvest (Numberwine, Quantity)
	VALUES(1, 800),
		  (2, 500),
		  (3, 350),
		  (4, 450),
		  (5, 750),
		  (6, 800),
		  (7, 250),
		  (8, 600),
		  (9, 360),
		  (10, 700),
		  (11, 800),
		  (12, 500),
		  (13, 350),
		  (14, 450),
		  (15, 750),
		  (16, 800),
		  (17, 250),
		  (18, 600),
		  (19, 360),
		  (20, 700),
		  (21, 800),
		  (22, 500),
		  (23, 350),
		  (24, 450),
		  (25, 750),
		  (26, 800),
		  (27, 250),
		  (28, 600),
		  (29, 360),
		  (30, 700);


INSERT INTO Producer (NumberProducer, NumberWine, FirstName, LastName, Region)
	VALUES(001, 1, 'Imagbo', 'Ofure', 'Tunis'),
		  (002, 2, 'Valetine', 'Ese', 'Sousse'),
		  (003, 3, 'Keneth', 'Omerue', 'Sfax'),
		  (004, 4, 'Tunde', 'Ednut', 'Tozeur'),
		  (005, 5, 'Haruna', 'Isam', 'Sousse'),
		  (006, 6, 'Jacob', 'Duke', 'Zarzis'),
		  (007, 7, 'Benard', 'Ise', 'Tunis'),
		  (008, 8, 'Ahmed', 'Tinubu', 'Sousse'),
		  (009, 9, 'Zara', 'Buhari', 'Gafsa'),
		  (010, 10, 'Emmanuel', 'Okoye', 'Sousse'),
		  (011, 11, 'Benson', 'Zem', 'Tunis'),
		  (012, 12, 'Victor', 'Eze', 'Sousse'),
		  (013, 13, 'David', 'Bolaji', 'Sfax'),
		  (014, 14, 'Sandra', 'Levi', 'Tozeur'),
		  (015, 15, 'Ken', 'Dim', 'Sousse'),
		  (016, 16, 'Precious', 'Festac', 'Sousse'),
		  (017, 17, 'Williams', 'Don', 'Tunis'),
		  (018, 18, 'Donatus', 'Etim', 'Sousse'),
		  (019, 19, 'Soma', 'Buchi', 'Tozeur'),
		  (020, 20, 'Mbom', 'Eket', 'Sousse'),
		  (021, 21, 'John', 'Terry', 'Sousse'),
		  (022, 22, 'Jay-Jay', 'Okocha', 'Sousse'),
		  (023, 23, 'Bassey', 'Lookman', 'Sfax'),
		  (024, 24, 'Alex', 'Iwobi', 'Tozeur'),
		  (025, 25, 'Victor', 'Oshimen', 'Sousse'),
		  (026,26, 'Peter', 'Okafor', 'Zarzis'),
		  (027, 27, 'Joy', 'Oma', 'Tunis'),
		  (028, 28, 'Goodluck', 'Shetima', 'Sousse'),
		  (029, 29, 'Cypril', 'Otito', 'Gafsa'),
		  (030, 30, 'Gregory', 'Okoye', 'Sousse');

--QUESTION 4
SELECT FirstName, LastName FROM Producer

--QUESTION 5
SELECT FirstName, LastName FROM Producer
ORDER BY FirstName ASC

--QUESTION 6
SELECT * FROM Producer
WHERE Region = 'Sousse'

SELECT * FROM Wine
SELECT * FROM Harvest
SELECT * FROM Producer

--QUESTION 7
SELECT SUM(Quantity) AS Total_Quantity FROM Harvest
WHERE Numberwine = 12

--QUESTION 8
SELECT
    SUM(Harvest.Quantity) AS Total_Quantity
FROM
    Harvest
JOIN
    Wine  ON Wine.NumberWine = Harvest.Numberwine

--Question 9
SELECT
    Producer.FirstName, Producer.LastName 
FROM
    Producer
JOIN
    Harvest  ON Harvest.Numberwine = Producer.Numberwine
WHERE Harvest.Quantity > 300

ORDER BY Producer.FirstName ASC

--Question 10
SELECT * FROM Wine
WHERE Degree > 12

SELECT
    * 
FROM
    Producer
JOIN
    Wine  ON Wine.Numberwine = Producer.Numberwine
JOIN
	Harvest ON Harvest.Numberwine = Producer.NumberWine
WHERE Producer.NumberProducer = 24











