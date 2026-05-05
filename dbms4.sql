CREATE DATABASE shop_db;
USE shop_db;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    Product VARCHAR(100),
    CustomerID INT
);

INSERT INTO Customers (CustomerID, CustomerName)
VALUES
(1, 'Alex Chen'),
(2, 'Maya Patel'),
(3, 'Kenji Sato');

INSERT INTO Orders (OrderID, Product, CustomerID)
VALUES
(101, 'Mac Book Pro', 1),
(102, 'Mechanical Keyboard', 1),
(103, 'Wireless Mouse', 2),
(104, '27-inch Monitor', 99);

-- INNER JOIN
SELECT Customers.CustomerName, Orders.OrderID, Orders.Product
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- LEFT JOIN
SELECT Customers.CustomerName, Orders.OrderID, Orders.Product
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- RIGHT JOIN
SELECT Customers.CustomerName, Orders.OrderID, Orders.Product
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- FULL JOIN (using UNION)
SELECT Customers.CustomerName, Orders.OrderID, Orders.Product
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.CustomerName, Orders.OrderID, Orders.Product
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
