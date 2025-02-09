-- reading product table

select * from dbo.Product
select * from dbo.Customer

SELECT  -- step4
    c.CustomerID,
	c.CustomerName,
	p.ProductName,
	c.TransctionDate,
	p.Price
FROM dbo.Product as p  -- step1
JOIN dbo.Customer as c ON p.ProductID = c.ProductID  -- step2  join is operator
WHERE p.ProductName = 'Mobile' -- step 3



/*-----------------Sequence Order of Execution-----------1.  FROM	:- Choose and 2. JOIN tables to get base data AND    ON3.  WHERE	:- To filter the base data4.  GROUP BY	:- To Aggregate the base data5.  HAVING	:- To filter the Aggregate data 6   SELECT	:- To Return/Read the Final data7.  ORDER BY	:- To sort the final data8.  TOP		:- To limit the returned datato a row count*/