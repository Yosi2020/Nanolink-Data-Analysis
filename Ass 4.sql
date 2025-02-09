-- 1--Create the database called Class and create the following table 

Create database class

USE [class]

CREATE TABLE DBO.Menu(
ItemID int IDENTITY(1000,1) not null primary key,
ItemName varchar(50),
ItemType varchar(50) not null,
CostToMake money null, 
Price money null,
WeeklySales int null,
MonthlySales int null,
YearlySales int null
);

--2. drop table [dbo].[Menu]

--3. recreate the table called Menu and insert the following data

INSERT INTO dbo.Menu
SELECT		'Big Mac','Hamburger',1.25,3.24,1015,5000,15853
union
SELECT		'Quarter Pounder / Cheese','Hamburger',1.15,3.24,1000,4589,16095
union
SELECT		'Half Pounder / Cheese','Hamburger',1.35,3.50,500,3500,12589
union
SELECT		'Whopper','Hamburger',1.55,3.99,989,4253,13000
union
SELECT		'Kobe Cheeseburger','Hamburger',2.25,5.25,350,1500,5000
union
SELECT		'Grilled Stuffed Burrito','Burrito',.75,5.00,2000,7528,17896
union
SELECT		'Bean Burrito','Burrito',.50,1.00,1750,7000,18853
union
SELECT		'7 layer Burrito','Burrito',.78,2.50,350,1000,2563
union
SELECT		'Dorito Burrito','Burrito',.85,1.50,600,2052,9857
union
SELECT		'Turkey and Cheese Sub','Sub Sandwich',1.75,5.50,1115,7878,16853
union
SELECT		'Philly Cheese Steak Sub','Sub Sandwich',2.50,6.00,726,2785,8000
union
SELECT		'Tuna Sub','Sub Sandwich',1.25,4.50,825,3214,13523
union
SELECT		'Meatball Sub','Sub Sandwich',1.95,6.50,987,4023,15287
union
SELECT		'Italian Sub','Sub Sandwich',2.25,7.00,625,1253,11111
union
SELECT		'3 Cheese Sub','Sub Sandwich',.25,6.00,815,3000,11853

select * from dbo.Menu

--3.Before we start updating and deleting, we want to do everything on a backup copy of the table.  
--Therefore, Create a menu_backup using the SELECT INTO Statement. 

select * into menu_backup from Menu

select * from menu_backup

--4. The 3 Cheese Sub is now made with 4 Cheeses.  The new name will be 4 Cheese Sub

update menu_backup 
set ItemName = '4 Cheese Sub'
where ItemName = '3 Cheese Sub'

--5. Italian Sub Monthly Sales were reported incorrectly.  There were really 1353 Sales.

update menu_backup
set MonthlySales = 1353
where ItemName = 'Italian Sub'

--6. The Whopper increased it’s price to $4.25

update menu_backup
set Price = 4.25
where ItemName = 'Whopper'

--7. It now cost $2.75 to make the 7 layer Burrito

update menu_backup
set CostToMake = 2.75
where ItemName = '7 layer Burrito'

--8. The prices of tortillas have gone up.  All Burrito prices should increase 10%

update menu_backup
set Price = Price * (1 + 0.1)
where ItemType = 'Burrito'

select * from menu_backup

--9. All products that bring in  < $1.00 profit per purchase need to be deleted

DELETE FROM dbo.menu_backup 
WHERE (Price - CostToMake) < 1.00

--10. We will be discontinuing any products that didn’t clear $10,000 in YearlySales Profit. 

DELETE FROM dbo.menu_backup
WHERE (Price - CostToMake) * YearlySales < 10000

--11.We just found out all the previous changes were incorrect.  Truncate the dbo.menu_backup table.

TRUNCATE TABLE dbo.menu_backup

select * from menu_backup

--12. Retrieve  all Burritos and sort by Price

select * 
from menu_backup
where ItemType = 'Burrito'
order by Price

--13. Retrieve all items that Cost more than $1.00 to make and sort by WeeklySales

select * 
from menu_backup
where CostToMake > 1.00
order by WeeklySales

--14. What’s the sum of total profit by ItemType

SELECT ItemType, SUM(Price - CostToMake) AS TotalProfit
FROM dbo.menu_backup
GROUP BY ItemType

--15. Retrieve Total Weekly Sales by ItemType of only items with more than 3000 weekly Sales.  Sort by Total Weekly Sales descending.

SELECT ItemType, SUM(WeeklySales) AS TotalWeeklySales
FROM dbo.menu_backup
WHERE WeeklySales > 3000
GROUP BY ItemType
ORDER BY TotalWeeklySales DESC


--16. Find out the profit made Weekly, Monthly and Yearly on Big Mac’s

SELECT 
  (Price - CostToMake) AS WeeklyProfit, 
  (Price - CostToMake) * 7 AS MonthlyProfit, 
  (Price - CostToMake) * 365 AS YearlyProfit
FROM dbo.menu_backup
WHERE ItemName = 'Big Mac'

--17. Retrieve the ItemType has more than $20,000 in Monthly Sales

SELECT ItemType
FROM dbo.menu_backup
GROUP BY ItemType
HAVING SUM(MonthlySales) > 20000

