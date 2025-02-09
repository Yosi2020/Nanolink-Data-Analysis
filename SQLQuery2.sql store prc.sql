CREATE the Following Stored Procedures----Database = Adventureworks	Name: CREATE PROCEDURE proc_TerritorySalesByYear--Hint:	Parameter: OrderYear--Tables: Sales.SalesOrderHeader--- Person.StateProvince--	Display the Total sales by territory for the Year Parameter

select top(3) * from Sales.SalesOrderHeader
select top(3) * from Person.StateProvince 


 create proc proc_TerritorySalesByYear

 as
 begin 
  select ps.Name,sum(ss.totaldue) as totalsales  
  from Sales.SalesOrderHeader as SS
  join Person.StateProvince  as PS
  on SS.TerritoryID=ps.TerritoryID
  where YEAR(DueDate)=2011 
  group by ps.Name

 end

 exec proc_TerritorySalesByYear

  create proc proc_TerritorySalesByYearwithparameter
  (@year as Datetime) 
 as
 begin 
  select ps.Name,sum(ss.totaldue) as totalsales  
  from Sales.SalesOrderHeader as SS
  join Person.StateProvince  as PS
  on SS.TerritoryID=ps.TerritoryID
  where YEAR(DueDate)=@year 
  group by ps.Name
 end

 exec proc_TerritorySalesByYearwithparameter 2011



 -----
 create proc proc_TerritorySalesByYearwithoutparameter
  (@year as Datetime, @name varchar(50) out, @totalsales int out) 
 as
 begin 
  select @name = ps.Name, @totalsales = sum(ss.totaldue) 
  from Sales.SalesOrderHeader as SS
  join Person.StateProvince  as PS
  on SS.TerritoryID=ps.TerritoryID
  where YEAR(DueDate)=@year 
  group by ps.Name
 end

 declare @name varchar(50)
 declare @totalsales int

 exec proc_TerritorySalesByYearwithoutparameter 2011,  @name out, @totalsales out
 select @name, @totalsales