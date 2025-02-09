


use demo;

CREATE TABLE Student (
    StudendId int not null
    ,LastName varchar(255) not null
    ,FirstName varchar(255) 
    ,Address varchar(255) 
    ,Mark int not null
	,income decimal(3,2)
	,dbo date
);

CREATE TABLE Players( 
   ID INT not null,
   First_Name VARCHAR(255) not null,
   Last_Name VARCHAR(255) not null,
   Date_Of_Birth date,
   Place_Of_Birth VARCHAR(255),
   Country VARCHAR(255),
   PRIMARY KEY (ID)
);

-- insert

INSERT INTO Players VALUES(1, 'Jone', 'Dhawan', '1981-12-05', 'Dallas', 'USA');
INSERT INTO Players values(2, 'Jonathan', 'Trott', '1981-04-22', 'CapeTown', 'SouthAfrica');
insert into Players values(3, 'wonde', 'Sangakkara', '1977-10-27', 'Matale', 'Srilanka');
insert into Players values(4, 'Alex', 'Kohli', '1988-11-05', 'Delhi', 'India');
insert into Players values(5, 'Abel', 'Sharma', '1987-04-30', 'Addis Abeba', 'Ethiopia');
insert into Players values(6, 'Kayle', 'Jadeja', '1988-12-06', 'Nagpur', 'India');
insert into Players values(7, 'James', 'Anderson', '1982-06-30', 'Asmera', 'Eritiria');

-- selecting top 5 from the database players
select top 5 * from [dbo].[Players];

-- select all players in ethiopia
select* from [dbo].[Players] 
where [Country] = 'Ethiopia';

--drop ---help to delete the object from the database

-- how to change the structure of table or database

Alter table [dbo].[Players] Add zip varchar(100);

Alter table [dbo].[Players] add age int;

Alter table [dbo].[Student] add POB varchar(100);

-- add gender column and change the data type from char into varchar

alter table [dbo].[Student] add gender char(1);

alter table [dbo].[Student] alter column gender varchar(10);

-- drop column

alter table [dbo].[Student] DROP column gender;
alter table [dbo].[Student] DROP column POB;

CREATE TABLE Persons (
	ID int NOT NULL,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255) NOT NULL,
	Age int
);

-- changing 
Alter table [dbo].[Persons] alter column 
Age int NOT NULL;

Alter table [dbo].[Persons] drop column ID;

ALTER TABLE dbo.persons
DROP CONSTRAINT UQ__Persons__3214EC26DED97B27

select * from dbo.Persons

Alter table [dbo].[Persons] add unique (ID)

ALTER Table [dbo].[Persons]
Add primary key (ID);

ALTER TABLE [dbo].[Persons] ADD 
CONSTRAINT persons_us PRIMARY KEY ( ID);



--Create database course

Create Database Course
use Course;

Create table Department(
	DeptID int not null Primary key,
	DeptName Varchar(20)
);

Insert into [dbo].[Department] 
values (1, 'IT');
Insert into [dbo].[Department] 
values (2, 'HR');
Insert into [dbo].[Department] 
values (3, 'ADMIN');
Insert into [dbo].[Department] 
values (4, '');

select * from [dbo].[Department];

create table EMPLOYEE(
	EmpID int not null primary key,
	EmpName varchar(50),
	Gender varchar(10) not null,
	Age int check (Age <=100),
	PhoneNumber varchar(20) not null unique,
	DeptID int foreign key references [dbo].[Department](DeptID),
	CreatedDate Datetime default getdate()
);

Alter table [dbo].[EMPLOYEE] alter Column 
Gender varchar(10) not null;

INSERT INTO dbo.Employee (EmpID,EmpName, Gender,Age,PhoneNumber,DeptID)--- no gender 
		SELECT 101,'Antony', 'Male' ,40,'9006491371',1

select * from [dbo].[EMPLOYEE];

INSERT INTO dbo.Employee (EmpID,EmpName,Gender,Age,PhoneNumber,DeptID)-- phonenumber '9006491371' is the same with the above 
		SELECT 103,'Dana','Female',30,'9006491373',1

INSERT INTO dbo.Employee (EmpID,EmpName,Gender,Age,PhoneNumber,DeptID)
		SELECT 104,'Katie','Female',50,'9006491374',4

INSERT INTO dbo.Employee (EmpID,EmpName,Gender,Age,PhoneNumber,DeptID)
		SELECT 102,'BradMan','Male',80,'9006491372',2

Execute sp_helpindex [EMPLOYEE];