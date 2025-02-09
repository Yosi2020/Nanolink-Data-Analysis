---DDL ( creating objects --- Database--sql --- GUI

--Creating Database Class1
-- create database DBNAME

create database Class1;

--- Create DB class2

create database Class2;

--- Create database Class3

create database Class3;

--- create Database Class4 and Class5 using GUI

---creating table

USE Class1
go

create table Student(
ID Integer, 
StudentName varchar(100),
Email varchar(100),
zipcode char(5),
);