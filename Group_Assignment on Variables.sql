
--(1) Declare a variables  
--	with integer type 
--	with String type
--	with Float type
--	with Date Type
--	with Datetime type


DECLARE @age int
DECLARE @name varchar(10)
DECLARE @heigth float
DECLARE @birthday date
DECLARE @CreatedAt datetime 


--(2) Assign respective values to the respective dataype variables with SET keyword

SET @age= 33;
SET @name='Liya'
SET @heigth=1.75
SET @birthday='1996-10-24'
SET @CreatedAt='9999-12-31 23:59:59'

--(3) Assign respective values to the respective dattype variables with SELECT keyword

SELECT @age= 33;
SELECT @name='Liya'
SELECT @heigth=1.75
SELECT @birthday='1996-10-24'
SELECT @CreatedAt='9999-12-31 23:59:59'

--(4) Declare a variable and Assign value with out using SET or SELECT Keywords

DECLARE @age int=33
DECLARE @name varchar(10)='Liya'
DECLARE @heigth float=1.75
DECLARE @birthday date='96-10-24'
DECLARE @CreatedAt datetime='2023-12-31 23:59:59'

--(5) Declare a variable and assign value to the variable by using table/column

--Methed 1
	DECLARE @PersonalData TABLE 
			( age int, 
			  FirstName varchar(10), 
			  height float,
			  birthday date,
			  CreatedAt datetime
			)
	INSERT INTO @PersonalData
	   VALUES
	   (10,'Eyu',1.56, convert(date, '2023-02-03', 120), convert(datetime, '2021-02-03 00:00:00'))

	select * from @PersonalData

--Methed 2
	declare @price float

	select @price=CostToMake from Menu
	select @price as 'price of table'

--(6)Swap the variable values 


Declare @MB Varchar(50) = 'Mahi'
Declare @HZ Varchar (50) = 'Elias'
Declare @Temp Varchar (50)  = 'Tamirayehu'
Set @Temp = @MB 
Set @MB = @HZ
Set @HZ= @Temp
select @MB as 'Name'
select @HZ as 'Name1'

Declare @x Table (IDNum int
,FName varchar(20)
,MName varchar(20)
,LName varchar(20),
age int)

Insert into @x values(1,'Sam','M','John',20),
(2,'Sonu','U','Kumar',23),
(3,'Mark','K','Ford',25),
(4,'don','N','Rick',29)

Select * from @x

Update @x
set MName=LName, LName=MName
Select * from @x

EXEC sp_rename 'MyTable.Column1', 'TempColumn', 'COLUMN';
EXEC sp_rename 'MyTable.Column2', 'Column1', 'COLUMN';
EXEC sp_rename 'MyTable.TempColumn', 'Column2', 'COLUMN';

--(7)Take datetime type variable and display Date format
	Declare @DT varchar (50)
	Select @DT = '2020-08-23 00:12:05'
  
  Select Convert(Date , @DT, 120) As 'Date'

--(8) Take Float type variable and display Integer format

 Declare @ET float 
 Set @ET = 1132.395 
 Select Cast ( @ET as Int ) AS 'salary'
 Select @ET AS 'Salaryfloat'


--(9) Take Integer variable value and try to display in String/Varchar datatype variable
declare @me int
declare @em varchar(50)
set @me = 44
select @em = cast(@me as varchar(50))
select @em as 'YZX'

--(10) Take String/Varchar  variable value and try to display in  Integer datatype variable. Will it work or not ??

-- Converting varchar into int is not possible 
declare @me1 int
declare @td1 varchar(50)
set @td1 = 'I love this section'
select @me1 = convert(int, @td1)
select @me1 as 'YZX'
---Converting string to int is sometimes possible ...it all depands on the type of varchar we use like word will not work and if it is nubmers it will work.

declare @me1 int
declare @td1 varchar(50)
set @td1 = '32'
select @me1 = convert(int, @td1)
select @me1 as 'YZX'
