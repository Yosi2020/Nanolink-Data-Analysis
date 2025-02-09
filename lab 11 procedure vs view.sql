use [AdventureWorks2017]

DECLARE @Var INT = 5

select @Var


--- used to hidden the sensative information

create view VW_CARDINFORMATION
AS
select [CreditCardID], [CardType], 
[ExpMonth],[ExpYear],[ModifiedDate]
from [Sales].[CreditCard]

select * from [dbo].[VW_CARDINFORMATION]


---- class work

select * from [HumanResources].[EmployeeDepartmentHistory]
select * from [HumanResources].[Department]

--select *  from [HumanResources].[Department] as D
--join [HumanResources].[EmployeeDepartmentHistory] as E
--on D.[DepartmentID] = E.[DepartmentID]
--group by d.[DepartmentName]


--- stored procedure  you can also use proc

Create procedure department_info_employee
as
begin
select * from [HumanResources].[Department]
end

Execute [dbo].[department_info_employee]

--single parameter depart name

create proc get_department_name
(@depname nvarchar(50))
as
begin
	select * from [HumanResources].[Department]
	where Name = @depname
end

exec [dbo].[get_department_name]N'Production'


--- multi parameter sales

create proc getTotalSales
(@SalesOrderID int, 
@SalesOrderNumber nvarchar(25)
)
as
begin
	select 
		[SalesOrderID],
		[OrderDate], 
		[SalesOrderNumber], 
		sum([TotalDue]) as 'Total Sales'
	from [Sales].[SalesOrderHeader]
	where [SalesOrderID] = @SalesOrderID and [SalesOrderNumber] = @SalesOrderNumber
	group by [SalesOrderID],[OrderDate], [SalesOrderNumber]
end

exec getTotalSales @SalesOrderID = 43659, @SalesOrderNumber=N'SO43659' 


--Using the Sales.SalesOrderHeader table create a--Stored Proc that displays the number of TerritoryID--Ex. How many TerritoryID's do we have for each Territory


create proc getTerritoryId
(@Territory int)
as
begin
	select [TerritoryID], count([TerritoryID]) 
	as 'total' from Sales.SalesOrderHeader
	where [TerritoryID] = @Territory
	group by [TerritoryID]
end

exec getTerritoryId 6


create proc getTotalSale
as
begin
	select [Name], sum([TotalDue]) as 'Total' 
	from [Sales].[SalesTerritory] as t
	join [Sales].[SalesOrderHeader] as S
	on t.TerritoryID = S.TerritoryID
	group by [Name]
	order by Total desc
end

exec getTotalSale

select * from [Sales].[SalesTerritory]
select * from [Sales].[SalesOrderHeader]