CREATE DATABASE CHECKPOINT6

--CREATING TABLE FOR CUSTOMER
CREATE TABLE Customer(Customer_id INT PRIMARY KEY ,
                      Customer_Name VARCHAR (100),
                      Customer_Tel VARCHAR (100));


--INSERTING INTO TABLE FOR CUSTOMER
   INSERT INTO Customer(Customer_id,Customer_Name,
                                Customer_Tel)
		       VALUES (001,'Alice',08034746219),
			          (002,'Bob', 07030141936),
					  (003,'Charlie', 08106260341);

			  
--CREATING TABLE FOR PRODUCTS 
CREATE TABLE Products(Products_id INT PRIMARY KEY,
                      Product_Name VARCHAR (100),Category VARCHAR(100),
                      Product_Price Decimal (10,2));

--INSERTING INTO TABLE FOR PRODUCTS
   INSERT INTO Products (Products_id, Product_Name, Category, Product_price)
      VALUES (1,'Widget','Appliances', 10.00),
	         (2, 'Gadget', 'Appliances',20.00),
			 (3, 'Doohickey', 'Appliances', 15.00);

CREATE TABLE Orders (Order_id INT PRIMARY key,
                     Customer_id INT,
                     Products_id INT,
                     OrderDate DATE,
                     Quantity INT);
                    


					
--INSERTING INTO TABLE FOR Orders
 INSERT INTO Orders (Order_id,Customer_id,Products_id,OrderDate,Quantity)
          VALUES(1,'001','1','2021-01-01','10'),
		        (2,'001','2','2021-01-02','5'),
				(3,'002','1','2021-01-03','3'),
				(4,'002','2','2021-01-04','7'),
				(5,'003','1','2021-01-05','2'),
				(6,'003','3','2021-01-06','3');
	SELECT * FROM Customer
	SELECT * FROM Products
	SELECT * FROM Orders

---(3)

	SELECT Customer.Customer_Name,Products.Product_Price * Orders.Quantity AS Total_cost
	from Customer
	JOIN Orders
	ON Customer.Customer_id = Orders.Customer_id
	JOIN Products
	ON Orders.Products_id	 = Products.Products_id
	WHERE Products.category IN ('Widget','Gadget') AND Orders.Quantity >=1;
	
--(4)A query to retrieve the names of customers who have placed an order for 
--atleast on widget along with the total cost of the widgest ordered by each customer.
	SELECT
    Customer.Customer_Name,
    SUM(Orders.Quantity * Products.Product_Price) AS total_cost
FROM
    Customer
JOIN
    Orders  ON Customer.Customer_id = Orders.Customer_id
JOIN
    Products  ON Orders.Products_id = Products.Products_id
WHERE
    Products.Product_Name = 'Widget'
GROUP BY
    Customer.Customer_Name

HAVING 
     SUM(Orders.Quantity) >= 1;


---(5)Write a query to retrieve the names of the customers who have placed an order
--for atleast one gadget along with the total cost of the gadgets ordered by each customer.

	SELECT
    Customer.Customer_Name,
    SUM(Orders.Quantity * Products.Product_Price) AS total_cost
FROM
    Customer 
JOIN
    Orders  ON Customer.Customer_id = Orders.Customer_id
JOIN
    Products  ON Orders.Products_id = Products.Products_id
WHERE
    Products.Product_Name = 'Gadget'
GROUP BY
    Customer.Customer_Name
HAVING
    SUM(Orders.Quantity) >= 1;


--(6).Write a query to retrieve the names of the customers who have placed an order
--for at least one doohickey, along with the total cost of the doohickeys ordered by each customer.
SELECT
    Customer.Customer_Name,
    SUM(Orders.Quantity * Products.Product_Price) AS total_cost
FROM
    Customer 
JOIN
    Orders  ON Customer.Customer_id = Orders.Customer_id
JOIN
    Products  ON Orders.Products_id = Products.Products_id
WHERE
    Products.Product_Name = 'Doohickey'
GROUP BY
    Customer.Customer_Name
HAVING
    SUM(Orders.Quantity) >= 1;

--(7) Write a query to retrieve the total number of widgets and gadgets 
--ordered by each customer, along with the total cost of the orders.

SELECT
    Customer.customer_name,
    SUM(CASE WHEN Products.Product_Name = 'Widget' THEN Orders.Quantity ELSE 0 END) AS total_widgets,
    SUM(CASE WHEN Products.Product_Name = 'Gadget' THEN Orders.Quantity ELSE 0 END) AS total_gadgets,
    SUM(Orders.Quantity * Products.Product_Price) AS total_cost
FROM
    Customer
JOIN
    Orders  ON Customer.Customer_id = Orders.Customer_id
JOIN
    Products ON Orders.Products_id = Products.Products_id
WHERE
    Products.Product_Name IN ('Widget', 'Gadget')
GROUP BY
    Customer.Customer_name;

----8 Write a query to retrieve the names of the products that have been ordered
--by at least one customer, along with the total quantity of each product ordered.
SELECT
    Products.Product_Name,
    SUM(Orders.Quantity) AS total_quantity_ordered
FROM
    Products 
JOIN
    Orders  ON Products.Products_id = Orders.Products_id
GROUP BY
    Products.Product_Name
HAVING
    SUM(Orders.Quantity) >= 1;

--(9)Write a query to retrieve the names of the customers who have placed the most orders, 
--along with the total number of orders placed by each customer.
   SELECT
    Products.Product_Name,
    SUM(Orders.Quantity) AS total_quantity_ordered
FROM
    Products 
JOIN
    Orders  ON Products.Products_id = Orders.Products_id
GROUP BY
    Products.Product_Name
HAVING
    SUM(Orders.Quantity) >= 1;

--10 Write a query to retrieve the names of the products that have been ordered the most, 
--along with the total quantity of each product ordered.
SELECT
    Products.Product_Name,
    SUM(Orders.Quantity) AS total_quantity_ordered
FROM
    Products 
JOIN
    Orders  ON Products.Products_id = Orders.Products_id
GROUP BY
    Products.Product_Name
ORDER BY
    total_quantity_ordered DESC;

--11 Write a query to retrieve the names of the customers who have placed an order on 
--every day of the week, along with the total number of orders placed by each customer.

SELECT
    Customer.Customer_Name,
    COUNT(DISTINCT Orders.OrderDate) AS total_days_ordered
FROM
    Customer 
JOIN
    Orders ON Customer.Customer_id = Orders.Customer_id
GROUP BY
    Customer.Customer_Name
HAVING
    COUNT(DISTINCT Orders.OrderDate) = 7;

