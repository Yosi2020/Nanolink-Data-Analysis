
declare @Today varchar(50)
select @Today = 'I love monday'
print @Today

-- used to see temporary datas in varibale 
select * from tempdb.sys.tables


/* Create table variable by joining [Production].[Product] and [Production].[ProductSubcategory] tables adventureworks database it display table variable ProductID, Name and ProductNumber,ProductLine,and Name(productsubcatagoryName) columns*/

declare @product table(
ProductID int, 
productName nvarchar(50),
ProductNumber nvarchar(25),
ProductLine nchar(2),
productsubcatagoryName nvarchar(50)
)

insert into @product(ProductID, productName, ProductNumber, ProductLine, productsubcatagoryName)
select p.[ProductID], p.[Name], p.[ProductNumber], p.[ProductLine], ps.[Name]
from [Production].[ProductSubcategory] as ps
join [Production].[Product] as p on ps.[ProductSubcategoryID] = p.[ProductSubcategoryID]

/*Create a view in Production.Product table AdventureWorks database it only returns the ProductID, Name and ProductNumber columns that productID greater than 900 */create view productid_g900with encryption asselect p.[ProductID], p.[Name], p.[ProductNumber], p.[ProductLine]
from [Production].[Product] as p
where p.[ProductID] > 900

select * from productid_g900

--- to drop a view
--drop view productid_g900

