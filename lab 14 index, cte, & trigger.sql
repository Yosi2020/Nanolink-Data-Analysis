use [MyDatabase]CREATE TABLE Customers(CustID INT IDENTITY(5,5),FirstName VARCHAR(20),LastName VARCHAR(20))INSERT INTO Customers VALUES('Doug', 'Jones'),('Vanessa', 'West'),('Gail', 'Shapiro')CREATE TABLE Orders(OrderID INT IDENTITY,CustID INT,OrderDate DATE,)INSERT INTO OrdersVALUES(5, '4/1/2021'),(5, '4/6/2021'),(10, '4/23/2021'),(15, '4/30/2021')select * from Customersselect * from Ordersselect c.FirstName, o.OrderDatefrom Customers as Cjoin Orders AS Oon o.CustID=c.CustIDcreate function CustomerFirstNAME()returns @FirstNameDate table(FirstName VARCHAR(20), OrderDate Date)asbegin	insert into @FirstNameDate	select c.FirstName, o.OrderDate	from Customers as C	join Orders AS O	on o.CustID=c.CustID	returnendselect * from CustomerFirstNAME()use [Company]select * from [dbo].[Company]where [CompanyID] = 4--- creating clustered index  create clustered index ix_Company_idon [dbo].[Company](CompanyID)--- creating non clustered indexcreate nonclustered index ix_Company_nameon [dbo].[Company]([CompanyName], [City])select * from [dbo].[Company]where City = 'Carrollton'---- cte example /*WITH department_avg AS (
  SELECT department, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department
)
SELECT employee_id, name, department, salary
FROM employees
INNER JOIN department_avg ON employees.department = department_avg.department
WHERE salary > department_avg.avg_salary;
*/


CREATE TABLE Product (   Product_id INT PRIMARY KEY,    Product_name VARCHAR(40),    Price INT,   Quantity INT  )  INSERT INTO Product VALUES(111, 'Mobile', 10000, 10),  (112, 'Laptop', 20000, 15),  (113, 'Mouse', 300, 20),  (114, 'Hard Disk', 4000, 25),  (115, 'Speaker', 3000, 20);begin transactioninsert into product values(116, 'Headphone',2000, 30)update Product set price = 450 where Product_id=113-- commit changecommit transactionselect * from Productbegin transactionupdate Product set price = 5000 where Product_id=114delete from Product where Product_id=116--undo changesrollback transaction