
CREATE DATABASE GoldenBasket;
USE GoldenBasket;


CREATE TABLE Customers (
    Customer_ID CHAR(6) PRIMARY KEY,
    Name VARCHAR(20),
    Phone_Number VARCHAR(15),
    Gender CHAR(1)
);

CREATE TABLE Products (
    Product_ID CHAR(10) PRIMARY KEY,
    Product_Name VARCHAR(20),
    Price FLOAT,
    Quantity_available INT
);


CREATE TABLE Purchases (
    Purchase_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID CHAR(6),
    Product_ID CHAR(6),
    Enrollment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);


INSERT INTO Customers VALUES
('CU0001','Rahim','01712345678','M'),
('CU0002','Karim','01812345678','M'),
('CU0003','Ayesha','01912345678','F');


INSERT INTO Products VALUES
('PR0001','Rice',50,100),
('PR0002','Oil',150,50),
('PR0003','Sugar',80,70);


INSERT INTO Purchases (Customer_ID, Product_ID) VALUES
('CU0001','PR0001'),
('CU0002','PR0002'),
('CU0003','PR0003');

select * from customers;

UPDATE Customers
SET Phone_Number = '01699999999'
WHERE Customer_ID = 'CU0001';


DELIMITER $$

CREATE TRIGGER update_quantity
AFTER INSERT ON Purchases
FOR EACH ROW
BEGIN
    UPDATE Products
    SET Quantity_available = Quantity_available - 1
    WHERE Product_ID = NEW.Product_ID;
END$$

DELIMITER ;

-- Test
INSERT INTO Purchases (Customer_ID, Product_ID)
VALUES ('CU0001','PR0001');

SELECT * FROM Products;