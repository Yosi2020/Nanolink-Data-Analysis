/*select  -- step5	c.CustomerID,	c.CustomerName,	p.ProductName,	SUM(p.Price) AS TotalPricefrom dbo.Product as p  --step 1join dbo.Customer as c on p.ProductID = c.ProductID  -- step2WHERE p.ProductName in('Mobile', 'Television')  -- step 3GROUP BY c.CustomerID,c.CustomerName,p.ProductName  --- step 4*/SELECT -- step 6	c.CustomerID	,C.CustomerName	,P.ProductName	,SUM(price) AS TotalSalesPerProduct  FROM dbo.Product P -- step 1JOIN dbo.Customer  C ON P.ProductID=C.ProductID  --step 2WHERE p.ProductName in('Mobile', 'Television') --and  SUM(price) > 100  -- step 3GROUP BY c.CustomerID,C.CustomerName,P.ProductName -- step 4HAVING  SUM(price) >100 -- step 5SELECT  TOP 2	c.CustomerID	,C.CustomerName	,P.ProductName	,SUM(price) AS TotalSalesPerProductFROM dbo.Product PJOIN dbo.Customer  C ON P.ProductID=C.ProductIDWHERE p.ProductName in('Mobile', 'Television')GROUP BY c.CustomerID,C.CustomerName,P.ProductName HAVING  SUM(price) >100ORDER BY p.ProductName asc--Antony Mobile			100								Antony	Television	200--BatMan	Mobile		400								BatMan	Television   200/*SELECT 	c.CustomerID	,C.CustomerName	,P.ProductName	,SUM(price) AS TotalSalesPerProductFROM dbo.Product PJOIN dbo.Customer  C ON P.ProductID=C.ProductIDGROUP BY c.CustomerID,C.CustomerName,P.ProductName*//*---------- Aggragate functions ------SUM AVGMAXMINCOUNT */-- manager asking total sells of the mobileSELECT	P.ProductName	,SUM(price) AS TotalSalesPerProductFROM dbo.Product PJOIN dbo.Customer  C ON P.ProductID=C.ProductID--WHERE p.ProductName in('Mobile', 'Television')GROUP BY P.ProductName -- average SELECT	p.ProductName	,avg(p.Price) as 'Avg transcation'FROM dbo.Product PJOIN dbo.Customer  C ON P.ProductID=C.ProductIDgroup by p.ProductNameorder by p.ProductName-- Max PriceSELECT	Max (p.Price) as 'Max Price'FROM dbo.Product P-- Min priceSELECT	Min(p.Price) as 'Min Price'FROM dbo.Product P