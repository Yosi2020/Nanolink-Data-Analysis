--- use constraintsASS tabel======================CREATE TABLE [dbo].[emp](	[EmpID] [int] NOT NULL,	[EmpName] [varchar](50) NULL,	[Gender] [varchar](10) NOT NULL,	[Age] [int] NULL,	[PhoneNumber] [varchar](20) NOT NULL,	[DeptID] [int] NULL	) ON [PRIMARY]GO------------------------STEP5------------INSERT INTO  [dbo].[emp] ([EmpID],[EmpName],[Gender],[Age],[PhoneNumber],[DeptID])SELECT 101	,'Antony',	'Male',	40,	'9006491371',	1	INSERT INTO  [dbo].[emp] ([EmpID],[EmpName],[Gender],[Age],[PhoneNumber],[DeptID])SELECT 102	,'BradMan',	'Male',	40,	'9006491372',	2	INSERT INTO  [dbo].[emp] ([EmpID],[EmpName],[Gender],[Age],[PhoneNumber],[DeptID])SELECT 103	,'Dana',	'Female',	30,	'9006491373',	1INSERT INTO  [dbo].[emp] ([EmpID],[EmpName],[Gender],[Age],[PhoneNumber],[DeptID])SELECT 104	,'Katie',	'Female',	50,	'9006491374',	3	INSERT INTO  [dbo].[emp] ([EmpID],[EmpName],[Gender],[Age],[PhoneNumber],[DeptID])SELECT 105	,'Emily',	'FeMale',	20,	'9006491375',	6	INSERT INTO  [dbo].[emp] ([EmpID],[EmpName],[Gender],[Age],[PhoneNumber],[DeptID])SELECT 106	,'Michel',	'Male',	25,	'9006491376',	7select * from dbo.emporder by EmpID-- run line 34-30 togetherwith cte as (select *, ROW_NUMBER()over (Partition by EmpName, Gender, Age, PhoneNumber, DeptIdOrder by EmpID) as RNFrom emp)Delete From cte where RN>1

