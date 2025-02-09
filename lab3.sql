----DDL
-- creating object

Create database Class1;

--- this is used to use database 
--use Class7;

--- Creating tabel

create table Student(
	Student_id int not null,
	Student_name varchar(100),
	Student_email varchar(50),
	Student_zipcode char(5),
);

--inserting a data

insert into[dbo].[Student] values 
(1, 'Jone', 'jone@gmail.com', '13243');

select * from [dbo].[Student];

insert into[dbo].[Student] values 
(2, 'Eyu', 'eyu@gmail.com', '12263');

insert into[dbo].[Student] values 
(3, 'Kebe', 'kebe@gmail.com', '57566');

select * from [dbo].[Student];


Create database demo;

