create database DBFeb

use DBFeb

--===========System Functions======CREATE TABLE  dbo.Products (ProductID int,ProductName varchar(50),UnitPrice int,UnitsInStock int,UnitsOnOrder int)INSERT INTO dbo.Products (ProductID,ProductName,UnitPrice,UnitsInStock,UnitsOnOrder)SELECT 1, 	'Pen', 			10, 	5, 		10INSERT INTO dbo.Products (ProductID,ProductName,UnitPrice,UnitsInStock,UnitsOnOrder)SELECT 2, 	'Shoe', 		20, 	8,		NULL	INSERT INTO dbo.Products (ProductID,ProductName,UnitPrice,UnitsInStock,UnitsOnOrder)SELECT 3, 	'Pencil', 		30, 	10,		15INSERT INTO dbo.Products (ProductID,ProductName,UnitPrice,UnitsInStock,UnitsOnOrder)SELECT 4, 	'Chair', 		40, 	6, 		8INSERT INTO dbo.Products (ProductID,ProductName,UnitPrice,UnitsInStock,UnitsOnOrder)SELECT 5, 	'WaterBottel', 20, 	20, 		10INSERT INTO dbo.Products (ProductID,ProductName,UnitPrice,UnitsInStock,UnitsOnOrder)SELECT 6, 	'Book', 		10, 	30,		''select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder from dbo.Products-- to get the total price that the indiviual can pay select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder,(UnitPrice* (UnitsInStock+ isnull(UnitsOnOrder, 0))) as TotalPriceAmountfrom dbo.Products--- to remove denominator zero value select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder,(UnitPrice / (nullif(UnitsOnOrder, 0))) as untipriceByunitsOnOrderfrom dbo.ProductsCREATE TABLE dbo.EMPLOYEE_DETAILS -- select * from dbo.EMPLOYEE_DETAILS(EmpID INT ,EmpFirstName VARCHAR(50),EmpMiddleName VARCHAR(50),EmpLastName VARCHAR(50),Gender VARCHAR(10) ,Age INT CHECK(Age <=100),PhoneNumber VARCHAR(20) ,EmailID varchar(100),DeptID int ,CreatedDate DATETIME DEFAULT getdate())INSERT INTO dbo.EMPLOYEE_DETAILS (EmpID,EmpFirstName,EmpMiddleName,EmpLastName,Gender,Age,PhoneNumber,EmailID,DeptID)SELECT 100,'Dana','Nais','Isaac','Female',20,'9006491370','Dana@gmail.com',1INSERT INTO dbo.EMPLOYEE_DETAILS (EmpID,EmpFirstName,EmpMiddleName,EmpLastName,Gender,Age,PhoneNumber,EmailID,DeptID)SELECT 101,NULL,'Antony',NULL,'Male',40,'9006491371','Antony@gmail.com',1INSERT INTO dbo.EMPLOYEE_DETAILS (EmpID,EmpFirstName,EmpMiddleName,EmpLastName,Gender,Age,PhoneNumber,EmailID,DeptID)SELECT 102,NULL,NULL,'BradMan','Male',30,'9006491372','BradMan@gmail.com',2INSERT INTO dbo.EMPLOYEE_DETAILS (EmpID,EmpFirstName,EmpMiddleName,EmpLastName,Gender,Age,PhoneNumber,EmailID,DeptID)SELECT 103,'Katie',NULL,NULL,'Female',50,'9006491373','Katie@gmail.com',3INSERT INTO dbo.EMPLOYEE_DETAILS (EmpID,EmpFirstName,EmpMiddleName,EmpLastName,Gender,Age,PhoneNumber,EmailID,DeptID)SELECT 104,NULL,'Cambell','Ellisa','Female',20,'9006491374','Cambell@gmail.com',4SELECT EmpID,EmpFirstName,EmpMiddleName,EmpLastName,Gender,Age,PhoneNumber,EmailID,DeptIDFROM dbo.EMPLOYEE_DETAILS--- Returns the first non-null expression in a list.SELECT EmpID,COALESCE(EmpFirstName,EmpMiddleName,EmpLastName) AS Name,Gender,Age,PhoneNumber,DeptIDFROM dbo.EMPLOYEE_DETAILS-- convert example /*convert --> you can convert int into string/varchar but not viceversalcast --> Convert a string value to an integer*/--====================DECLARE @a float = 85.30SELECT CAST('12' AS INT) as ConvertedInt;SELECT CONVERT(VARCHAR(10), GETDATE(), 126) as ConvertedDate; --Convert a date to string--====================select top 1 *,convert(varchar(50),CreatedDate,112) from dbo.EMPLOYEE_DETAILS --20220827select top 1  *,convert(varchar(50),CreatedDate,114) from dbo.EMPLOYEE_DETAILS --13:40:37:647select top 1  *,convert(varchar(50),CreatedDate,110) from dbo.EMPLOYEE_DETAILS --08-27-2022select top 1  *,convert(varchar(50),CreatedDate,111) from dbo.EMPLOYEE_DETAILS --2022/08/27select top 1  *,convert(varchar(50),CreatedDate,101) from dbo.EMPLOYEE_DETAILS   --08/27/2022select top 1  *,convert(varchar(50),CreatedDate,100) from dbo.EMPLOYEE_DETAILS --Aug 27 2022  1:40PMselect * from dbo.EMPLOYEE_DETAILS