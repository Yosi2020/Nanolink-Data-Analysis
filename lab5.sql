
create database MyFirstDB;

use MyFirstDB;

--Step2 : Create Product TableCREATE TABLE dbo.Product (ProductID INT NOT NULL PRIMARY KEY,ProductName VARCHAR(20),Price INT)--Step3 : Enter data in Product tableINSERT INTO dbo.Product (ProductID,ProductName,Price)SELECT 101,'Mobile','100'INSERT INTO dbo.Product (ProductID,ProductName,Price)select 102,'Television','200'INSERT INTO dbo.Product (ProductID,ProductName,Price)select 103,'LapTop','300'INSERT INTO dbo.Product (ProductID,ProductName,Price)select 104,'Refregerator','400'--Step4 : Create Customer tableCREATE TABLE dbo.Customer (CustomerID INT,CustomerName VARCHAR(20),TransctionDate DATETIME ,ProductID INT NOT NULL FOREIGN KEY REFERENCES  dbo.Product(ProductID))--Step5 : Enter data in Customer tableINSERT INTO dbo.Customer (CustomerID,CustomerName,TransctionDate,ProductID)select 1,'Antony','2022-01-01 20:17:27.627',101INSERT INTO dbo.Customer (CustomerID,CustomerName,TransctionDate,ProductID)select 1,'Antony','2022-01-01 19:17:27.627',102INSERT INTO dbo.Customer (CustomerID,CustomerName,TransctionDate,ProductID)select 2,'BatMan','2022-01-02 02:18:27.627',101INSERT INTO dbo.Customer (CustomerID,CustomerName,TransctionDate,ProductID)select 2,'BatMan','2022-01-02 01:18:27.627',101INSERT INTO dbo.Customer (CustomerID,CustomerName,TransctionDate,ProductID)select 2,'BatMan','2022-01-02 03:18:27.627',102INSERT INTO dbo.Customer (CustomerID,CustomerName,TransctionDate,ProductID)select 2,'BatMan','2022-01-03 04:18:27.627',101INSERT INTO dbo.Customer (CustomerID,CustomerName,TransctionDate,ProductID)select 2,'BatMan','2022-01-04 05:18:27.627',101INSERT INTO dbo.Customer (CustomerID,CustomerName,TransctionDate,ProductID)select 3,'Cambel','2022-01-04 06:18:27.627',103-- To read product tableselect * from dbo.Product-- To read customer tableselect * from dbo.Customer--Join two tabel using product id select 	C.CustomerID, 	C.CustomerName, 	p.ProductName, 	p.Pricefrom dbo.Product p Join dbo.Customer c on p.ProductID=c.ProductID;