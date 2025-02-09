
--try--- catch error handling

CREATE PROCEDURE divide_numbers
    @numerator int,
    @denominator int
AS
BEGIN TRY
    DECLARE @result float
    SET @result = @numerator / @denominator
    SELECT @result
END TRY
BEGIN CATCH
    SELECT 'Error: ' + ERROR_MESSAGE()
END CATCH


--CREATE the Following Stored Procedures----Database = Adventureworks	Name: CREATE PROCEDURE proc_TerritorySalesByYear--Hint:	Parameter: OrderYear--Tables: Sales.SalesOrderHeader--- Person.StateProvince--	Display the Total sales by territory for the Year Parameter

create proc proc_TerritorySalesByYear
(@orderYear int)
as
begin
	select sp.[Name],year(so.OrderDate), sum(so.TotalDue) 
	from [Person].[StateProvince] as sp
	join [Sales].[SalesOrderHeader] as so 
	on sp.TerritoryID = so.TerritoryID
	where year(so.OrderDate) = @orderYear
	group by year(so.OrderDate), sp.[Name]
end

EXEC proc_TerritorySalesByYear 2013

---- user defined function
--- scalar user defined function

/*
snytax for scalar user define function

create function Function_Name (Input parameter)
return datatype
as
begin
    Return Expression
end

*/

create database Company
use Company

Create table Company	  (CompanyID int,	   CompanyName varchar(50),	   City varchar(50)	  )INSERT INTO dbo.Company (CompanyID,CompanyName,City)   SELECT 1,'Walmart','Dallas' UNION   SELECT 2,'Target','Irving' UNION   SELECT 3,'K-Mart','Carrollton' UNION   SELECT 4,'K-Mart','Dallas' UNION   SELECT 5,'Target','Carrollton' UNION   SELECT 6,'Burger King','Irving' UNION   SELECT 7,'Taco Bell','Irving' UNION   SELECT 8,'KFC','Dallas'

select * from Company

create function getCompanyByCity (@city varchar(50))
returns table
as
return (
	select * from Company
	where City = @city
	)

select * from getCompanyByCity('Dallas')


CREATE TABLE student(    id INT PRIMARY KEY,    name VARCHAR(50) NOT NULL,    gender VARCHAR(50) NOT NULL,    DOB datetime NOT NULL,    total_score INT NOT NULL,     )INSERT INTO studentVALUES (1, 'Jolly', 'Female', '12-JUN-1989', 500), (2, 'Jon', 'Male', '02-FEB-1974', 545), (3, 'Sara', 'Female', '07-MAR-1988', 600), (4, 'Laura', 'Female', '22-DEC-1981', 400), (5, 'Alan', 'Male', '29-JUL-1993', 500), (6, 'Kate', 'Female', '03-JAN-1985', 500), (7, 'Joseph', 'Male', '09-APR-1982', 643), (8, 'Mice', 'Male', '16-AUG-1974', 543), (9, 'Wise', 'Male', '11-NOV-1987', 499), (10, 'Elis', 'Female', '28-OCT-1990', 400);

select * from student

/*
create an inline table-valued function that will retrieve recordsof all the students whose DOB is less than the 
DOB passed to the function.
*/

create function studentLessthanPass(@Passpoint int)
returns table
as
return(
   select * from student
   where total_score < @Passpoint)

select * from studentLessthanPass(500)

-- Scalar UDF

CREATE FUNCTION fnCalculateTax
(
   @price decimal(10,2),
   @tax_rate decimal(4,2)
)
RETURNS decimal(10,2)
AS
BEGIN
   DECLARE @tax decimal(10,2)
   SET @tax = @price * @tax_rate
   RETURN @tax
END




/*
CREATE TRIGGER trigger_name
ON table_name
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- statements to be executed
END

*/