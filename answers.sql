use sampledb;
-- Question 1 Achieving 1NF (First Normal Form).

-- Create the ProductDetail Table
CREATE TABLE ProductDetail(
OrderID INT,
CustomerName VARCHAR(100),
Products VARCHAR(100)
);

-- Insert Data into the ProductDetail Table. 
INSERT INTO ProductDetail (OrderID, CustomerName,Products)
VALUES 
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Laptop'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Retrieve the data from the ProductDetail table.
SELECT * FROM ProductDetail;

-- Question 2 Achieving 2NF (Second Normal Form). 

-- Insert data into the Orders Table.
INSERT INTO orders(OrderID, CustomerName)
Values (101,'John Doe')
(101,'Jane Doe')
(101,'John Doe')

-- Create the product table.
Create Table products (
Product_ID Int primary key
ProductName
Quantity
OrderID
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID));

-- Insert the data into the product table.
INSERT INTO Products (Product_ID, ProductName, Quantity)
values 
(1,'Laptop', 2,101),
(2,'Mouse', 1, 101),
(3,'Tablet', 1, 103),
(4,'Keyboard', 1, 102),
(5,'Mouse', 1, 102),
(6,'Phone', 1, 103);