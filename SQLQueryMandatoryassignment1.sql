use ABCFashion
go
SELECT * FROM Salesman;
SELECT * FROM customer;
SELECT CustomerName, PurchaseAmount FROM customer;
SELECT * FROM Customer;
EXEC sp_help customer;
SELECT CustomerID, CustomerName, Grade FROM customer;
SELECT TOP 1 * FROM customer;
SELECT CustomerName, City FROM customer;
SELECT * FROM customer
WHERE City = 'California';
INSERT INTO customer (CustomerID, CustomerName, PurchaseAmount, SalesmanId)
VALUES
(2345, 'Andrew', 550, 101),
(1575, 'Lucky', 1500, 103),
(3747, 'Remona', 2000, 107),
(4004, 'Julia', 4545, 110 );
EXEC sp_help customer;
SELECT * FROM orders;
SELECT ProductName, SUM(Quantity * Price) AS TotalSales
FROM Sales
GROUP BY ProductName;
CREATE TABLE Sales (
    SaleID INT,
    CustomerName VARCHAR(50),
    ProductName VARCHAR(50),
    Quantity INT,
    Price INT
);
INSERT INTO Sales VALUES
(1, 'John', 'Laptop', 2, 500),
(2, 'Jane', 'Tablet', 1, 300),
(3, 'Mike', 'Laptop', 1, 500),
(4, 'Sara', 'Phone', 3, 200),
(5, 'Tom', 'Tablet', 2, 300);
SELECT * FROM Sales;
INSERT INTO Sales (CustomerName, PurchaseAmount, SalesDate)
VALUES
('John', 100, '2023-01-01'),
('Alice', 200, '2023-01-02'),
('Bob', 150, '2023-01-03');

SELECT 
    CustomerName,
    SUM(Quantity * Price) AS TotalSales
FROM Sales
GROUP BY CustomerName;
SELECT c.CustomerName, c.PurchaseAmount
FROM customer c
JOIN #Salesman s
ON c.Salesman = s.Name;
SELECT *
FROM Customer
WHERE CustomerName LIKE '%N'
AND PurchaseAmount > 500;
SELECT
o.OrderDate,
s.SalesmanName,
c.CustomerName,
s.Commission,
s.City
FROM Orders o
JOIN Salesman s ON o.SalesmanId = s.SalesmanId
JOIN Customer c ON o.CustomerId = c.CustomerId
WHERE c.PurchaseAmount BETWEEN 500 AND 1500;
SELECT *
FROM Salesman s
RIGHT JOIN Orders o
ON s.SalesmanId = o.SalesmanId;
-- Unique SalesmanIds (without duplicates)
SELECT SalesmanId FROM Salesman
UNION
SELECT SalesmanId FROM Customer;
-- SalesmanIds including duplicates
SELECT SalesmanId FROM Salesman
UNION ALL
SELECT SalesmanId FROM Customer;
-- Primary Key for Salesman
ALTER TABLE Salesman
ADD CONSTRAINT pk_salesman PRIMARY KEY (SalesmanId);
-- Default constraint for City
ALTER TABLE Salesman
ADD CONSTRAINT df_city DEFAULT 'Not Mentioned' FOR City;
-- Foreign Key constraint in Customer
ALTER TABLE Customer
ADD CONSTRAINT fk_salesman FOREIGN KEY (SalesmanId) REFERENCES
Salesman(SalesmanId);
-- NOT NULL constraint for CustomerName
ALTER TABLE Customer
ALTER COLUMN CustomerName VARCHAR(50) NOT NULL;