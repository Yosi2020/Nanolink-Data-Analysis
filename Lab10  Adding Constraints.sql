create database ConstraintsAssUSE ConstraintsAss;GO CREATE TABLE Customer(	CustID int null,	CustName varchar(50) null,	EntryDate datetime null); CREATE TABLE SalesReps(	 RepID int null,	 RepName varchar(50),	 HireName datetime null ); CREATE TABLE Sales(	 SalesID int null,	 CustID int null,	 RepID int null,	 SalesDate datetime null,	 UnitCount int null,	 VerificationCode varchar(50) null);select * from [dbo].[Sales]--Alerting  Column ALTER TABLE [dbo].[Sales] ALTER COLUMN SALESID INT NOT NULL--Adding a PKAlter TABLE [dbo].[Sales]ADD CONSTRAINT PK_SalesID PRIMARY KEY (SalesID)--Adding Unique Key(UC)Alter Table [dbo].[Sales]Add  Constraint  UC_VerificationCodeunique (VerificationCode)--Getdatealter table Salesadd constraint df_SalesDatedefault getDate() FOR SalesDate;Alter TABLE [dbo].[Customer]add [CustID] int IDENTITY(500,3) NOT NULLDeclare @EmpID float --DEclare the variableset @EmpID=120.35     --Assigning value to valueselect CAST(@EMPID AS INT) --Read Variable--- work with mahiSELECT * FROM [dbo].[Customer]
 INSERT  INTO [dbo].[Customer] VALUES ( 1,'MAHI',02/30/2020,500)
 INSERT  INTO [dbo].[Customer] VALUES ( 2,'MAHII',02/30/2020,4)
  INSERT  INTO [dbo].[Customer] VALUES ( 3,'MAHIII',02/30/2020,3)
   INSERT  INTO [dbo].[Customer] VALUES ( 8,'MAHIII',CONVERT(DATETIME, '2022-02-01 10:00:00', 120),11)


   SELECT * INTO C_BACKUP FROM [dbo].[Customer]
   CREATE TABLE Customer1(
  CustID int identity(1,1) not null,
  CustName varchar(50) null,
  EntryDate datetime null
  primary key(CustId)
);

SELECT * FROM Customer1
SELECT * FROM C_BACKUP

INSERT INTO dbo.Customer1(CustName, EntryDate)
SELECT CustName, EntryDate
FROM C_BACKUP;