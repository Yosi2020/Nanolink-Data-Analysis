

create proc PowerBI
as
SELECT SalesOrderID,
       SH.TerritoryID,
     [Name],
     CountryRegionCode,
     [Group],
     SalesYTD,
     SalesLastYear,
     OrderDate,
     DueDate,
     ShipDate,
     OnlineOrderFlag,
     SubTotal,
     TaxAmt,
     TotalDue
FROM [Sales].[SalesOrderHeader] SH
JOIN [Sales].[SalesTerritory] ST 
ON SH.TerritoryID = ST.TerritoryID


exec [dbo].[PowerBI]