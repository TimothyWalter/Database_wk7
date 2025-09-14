-- Q1.transforming the product detail table into 1NF

SELECT 
    OrderID,
    CustomerName,
    LTRIM(RTRIM(value)) AS Product
FROM ProductDetail
CROSS APPLY STRING_SPLIT(Products, ',');


-- Q2.Tranforming the product details tables into 2NF by removing partial dependencies
--  Ensuring that each non-key column fully depends on the entire primary key.

CREATE TABLE OrderDetails2NF (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT, -- surrogate key
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT
);

INSERT INTO OrderDetails2NF (OrderID, CustomerName, Product, Quantity)
SELECT OrderID, CustomerName, Product, Quantity
FROM OrderDetails;
