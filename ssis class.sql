use ssis

--truncate table SalesOrder

--drop table SalesOrder

select top(100) * from SalesOrder

--now we create a view to make our data to sepecific on

create view [dbo].[SalesDetail]
as
select [Copy of Order ID],[Copy of Segment],[Copy of State],[Copy of Category], sum([Copy of Sales]) as TotalSales 
from [dbo].[SalesOrder1]
group by [Copy of Order ID],[Copy of Segment],[Copy of State],[Copy of Category]


select [Copy of Postal Code]= null from [dbo].[SalesOrder1]

select * from [dbo].[SalesDetail]



/*
? :

if/else

if(age > 40):
	print(old)
else:
	print(young)

(age>40) ? print(old) : print(young)  

&& --> AND
 ---> or

*/


--[TotalSales] > 200000 ? "Maximumn_sales" : [TotalSales]<=200000 && [TotalSales]>100000 ? "Average_sale":[TotalSales] <= 100000 && [TotalSales]>50000 ? "Lessthan_average_sales" : [TotalSales] <=50000 && [TotalSales]>10000? "Low_Sales":"Minimal_Sales"

select * from [dbo].[SalesDetailSSIS]

select [Copy of Order ID] from [dbo].[Lookup]

update [dbo].[Lookup]
set 
    [Copy of Order Date] = ?,
    [Copy of Ship Date] = ?,
    [Copy of Ship Mode] = ?,
    [Copy of Customer ID] = ?, 
    [Copy of Customer Name] = ?, 
    [Copy of Segment] = ?,
    [Copy of Country] = ?,
    [Copy of City] = ?,
    [Copy of State] = ?,
    [Copy of Postal Code] = ?,
    [Copy of Region] = ?,
    [Copy of Product ID] = ?, 
    [Copy of Category] = ?, 
    [Copy of Sub-Category] = ?,
    [Copy of Product Name] = ?,
    [Copy of Sales] = ?,
    [Copy of Quantity] = ?, 
    [Copy of Discount] = ?,
    [Copy of Profit] = ?
  where [Copy of Order ID] = ?







CREATE TABLE [dbo].[tbl_Conditional_Split](	[Order_ID] [varchar](25) NULL,	[Order_Date] [datetime] NULL,	[Ship_Date] [datetime] NULL,	[Ship_Mode] [varchar](50) NULL,	[Customer_ID] [varchar](25) NULL,	[Customer_Name] [varchar](50) NULL,	[Segment] [varchar](50) NULL,	[Country] [varchar](50) NULL,	[City] [varchar](50) NULL,	[State] [varchar](50) NULL,	[Postal_Code] [varchar](50) NULL,	[Region] [varchar](50) NULL,	[Product_ID] [varchar](50) NULL,	[Category] [varchar](50) NULL,	[Sub_Category] [varchar](50) NULL,	[Sales] [real] NULL,	[Quantity] [bigint] NULL,	[Discount] [real] NULL,	[Profit] [real] NULL) ON [PRIMARY]--@name = 'eyu, Ab ' ---> Firstname --> ab   lastname ---> eyu--substring(name, charindex(',', name)+1, len(name))--Ab  --> ltrim rtrim--eyu--substring(name, 1, charindex(',', name)-1)--findindex--select * from [dbo].[tb_split_using_comma]--charindex ---> finding index of character select * from [dbo].[Coditional_split]CREATE TABLE [dbo].[Merge_Statment](	[Order_ID] [varchar](25) NULL,	[Order_Date] [datetime] NULL,	[Ship_Date] [datetime] NULL,	[Ship_Mode] [varchar](50) NULL,	[Customer_ID] [varchar](25) NULL,	[Customer_Name] [varchar](50) NULL,	[Segment] [varchar](50) NULL,	[Country] [varchar](50) NULL,	[City] [varchar](50) NULL,	[State] [varchar](50) NULL,	[Postal_Code] [varchar](50) NULL,	[Region] [varchar](50) NULL,	[Product_ID] [varchar](50) NULL,	[Category] [varchar](50) NULL,	[Sub_Category] [varchar](50) NULL,	[Sales] [real] NULL,	[Quantity] [bigint] NULL,	[Discount] [real] NULL,	[Profit] [real] NULL,	[ModifiedDate] [date] NULL,	[InsertedDate] [date] NULL)create proc Group4_meregeasbegin;with cte_merge AS  (select *,  ROW_NUMBER() over(partition by [Copy of Row ID] order by [Copy of Row ID] desc) AS Row_Num    from [dbo].[Coditional_split])	Merge into [dbo].[Merge_Statment] AS Target using	cte_merge AS Source ON Source.[Copy of Row ID] = Target.Order_ID AND Source.Row_Num=1   when matched then update  set   Target.Order_ID	=	Source.[Copy of Row ID],Target.Order_Date	=	Source.[Copy of Order Date],Target.Ship_Date	=	Source.[Copy of Ship Date],Target.Ship_Mode	=	Source.[Copy of Ship Mode],Target.Customer_ID	=	Source.[Copy of Customer ID],Target.Customer_Name	=	Source.[Copy of Customer Name],Target.Segment	=	Source.[Copy of Segment],Target.Country	=	Source.[Copy of Country],Target.City	=	Source.[Copy of City],Target.State	=	Source.[Copy of State],Target.Postal_Code	=	Source.[Copy of Postal Code],Target.Region	=	Source.[Copy of Region],Target.Product_ID	=	Source.[Copy of Product ID],Target.Category	=	Source.[Copy of Category],Target.Sub_Category	=	Source.[Copy of Sub-Category],Target.Sales	=	Source.[Copy of Sales],Target.Quantity	=	Source.[Copy of Quantity],Target.Discount	=	Source.[Copy of Discount],Target.Profit	=	Source.[Copy of Profit] ,ModifiedDate	=	GETDATE() when not matched by target  then   INSERT ([Order_ID]  , [Order_Date]  , [Ship_Date]  , [Ship_Mode]  , [Customer_ID]  , [Customer_Name]  , [Segment]  , [Country]  , [City]  , [State]  , [Postal_Code]  , [Region]  , [Product_ID]  , [Category]  , [Sub_Category]  , [Sales]  , [Quantity]  , [Discount]  , [Profit]  , [InsertedDate])         VALUES(Source.[Copy of Row ID]           ,Source.[Copy of Order Date]           ,Source.[Copy of Ship Date]           ,Source.[Copy of Ship Mode]           ,Source.[Copy of Customer ID]           ,Source.[Copy of Customer Name]           ,Source.[Copy of Segment]           ,Source.[Copy of Country]           ,Source.[Copy of City]           ,Source.[Copy of State]           ,Source.[Copy of Postal Code]           ,Source.[Copy of Region]           ,Source.[Copy of Product ID]           ,Source.[Copy of Category]           ,Source.[Copy of Sub-Category]           ,Source.[Copy of Sales]           ,Source.[Copy of Quantity]           ,Source.[Copy of Discount]           ,Source.[Copy of Profit]		   ,GETDATE()		   )	when not matched by Source	 then delete;end exec [dbo].[Group4_merege]CREATE TABLE [dbo].[tbl_SCDs](	[Order_ID] [varchar](25) NOT NULL,	[Order_Date] [datetime] NULL,	[Ship_Date] [datetime] NULL,	[Ship_Mode] [varchar](50) NULL,	[Customer_ID] [varchar](25) NOT NULL,	[Customer_Name] [varchar](50) NOT NULL,	[Segment] [varchar](50) NULL,	[Country] [varchar](50) NULL,	[City] [varchar](50) NULL,	[State] [varchar](50) NULL,	[Postal_Code] [varchar](50) NULL,	[Region] [varchar](50) NULL,	[Product_ID] [varchar](50) NULL,	[Category] [varchar](50) NULL,	[Sub_Category] [varchar](50) NULL,	[Sales] [real] NULL,	[Quantity] [bigint] NULL,	[Discount] [real] NULL,	[Profit] [real] NULL,	[StartDate] [date] NULL,	[EndDate] [date] NULL)https://www.youtube.com/watch?v=TVdKGPcldPI&list=PLWf6TEjiiuIA_FdgfZaQWKSQ2LWyPkLqn&ab_channel=TechBrothersIT