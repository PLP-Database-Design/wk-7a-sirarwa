/*Qeustion 1: Converting the ProductDetail table to 1NF.
Create a new table to store the 1NF compliant data.*/
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

-- Insert data into the new table, splitting the Products column into individual rows.
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
SELECT
    OrderID,
    CustomerName,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', n), ',', -1)) AS Product
FROM ProductDetail
CROSS JOIN (
    SELECT 1 AS n UNION ALL
    SELECT 2 UNION ALL
    SELECT 3 UNION ALL
    SELECT 4 UNION ALL
) AS numbers
WHERE n <= LENGTH(Products) - LENGTH(REPLACE(Products, ',', '')) + 1;

-- Drop the original table
DROP TABLE ProductDetail;

-- Rename the new table to the original table name.
ALTER TABLE ProductDetail_1NF RENAME TO ProductDetail;

-- Select all data from the new table
SELECT * FROM ProductDetail;

/*Question 2: Converting the OrderDetails table into 2NF by removing partial dependencies. 
Create a new table for Customers (to remove the partial dependency)*/
CREATE TABLE Customers (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Insert distinct OrderID and CustomerName pairs into the Customers table.
INSERT INTO Customers (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Create a new table for OrderDetails without CustomerName.
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Customers(OrderID)
);

-- Insert the remaining data into the OrderDetails_2NF table.
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity)
SELECT
    OrderID,
    Product,
    Quantity
FROM OrderDetails;
-- Select all data from the new tables to show the result.
SELECT * FROM Customers;
SELECT * FROM OrderDetails_2NF;