CREATE DATABASE ETHIOPIADB
use ETHIOPIADB

create table dbo.Dept(
	DeptID int null,
	DeptName varchar(100) null
)

Alter table dbo.Dept alter column 
DeptID int not null;

-- altering column name
sp_rename 'dbo.Dept.DeptName', 
'DepartmentName', 'column'

sp_rename 'dbo.Dept.DepartmentName', 
'DeptName', 'column'

-- renaming table name 
sp_rename 'dbo.Dept',
'eyu'

sp_rename 'dbo.eyu',
'Dept'

--- INSERTING WAYS

--1
INSERT INTO dbo.Dept (DeptID, DeptName)
select 101, 'Mike'

--2
INSERT INTO dbo.Dept
select 102, 'Tyson'

--3
INSERT INTO dbo.Dept 
Values(103, 'senet')

INSERT INTO dbo.Dept 
Values(104, 'carbell')

INSERT INTO dbo.Dept
select 105, ''

INSERT INTO dbo.Dept (DeptID)
select 106


select * from dbo.Dept

-- deleting the data where his id is 105
DELETE from dbo.Dept where DeptID = 105

-- truncate delete all data from the table  
Truncate table dbo.Dept

-- deleteing table
DELETE from dbo.Dept

-- creating comment using CTRL + KC
--create schema office

-- updating specific data
Update dbo.Dept set DeptName= 'HR1' where DeptID=105

select * from dbo.Dept