use COURSE1

select * from [dbo].[emp]  --Employee Table
select * from [dbo].[dept]  --Department Table


-- homework answer
select d.DeptID,d.DeptName,e.EmpID,e.EmpName,e.Gender,e.Age,e.PhoneNumber,e.DeptID
from dbo.dept d  left join dbo.emp e  on d.DeptID = e.DeptID where e.DeptID is null

select d.DeptID,d.DeptName,e.EmpID,e.EmpName,e.Gender,e.Age,e.PhoneNumber,e.DeptID
from dbo.dept as d right join dbo.emp as e on d.DeptID = e.DeptID where d.DeptID is null
 

 select d.DeptID,d.DeptName,e.EmpID,e.EmpName,e.Gender,e.Age,e.PhoneNumber,e.DeptID
from dbo.dept d join dbo.emp e  on d.DeptID = e.DeptID 

/*  INNER JOIN
select 
	e.EmpID,
	e.EmpName,
	e.Gender,
	e.PhoneNumber,
	d.DeptName
from dbo.dept as d
 join dbo.emp as e
on d.DeptID = e.DeptID */

--select d.DeptID,d.DeptName,e.EmpID,e.EmpName,e.Gender,e.Age,e.PhoneNumber,e.DeptID
--from dbo.dept as d   left join dbo.emp as e  on d.DeptID = e.DeptID --where e.deptid is null


/*  Left join (Home work is to get the same results with Right Join )

select d.DeptID,d.DeptName,e.EmpID,e.EmpName,e.Gender,e.Age,e.PhoneNumber,e.DeptID
 from  dbo.emp e left join  dbo.dept d on d.DeptID = e.DeptID where d.DeptID is null

 O/P :-
 DeptID	DeptName	EmpID	EmpName	Gender	Age	PhoneNumber	DeptID
NULL	NULL	105	Emily	FeMale	20	9006491375	6
NULL	NULL	106	Michel	Male	25	9006491376	7
 */


 /*  Right Join (Home work is to get the same results with Left Join )

 select d.DeptID,d.DeptName,e.EmpID,e.EmpName,e.Gender,e.Age,e.PhoneNumber,e.DeptID
from  dbo.emp as e   right join dbo.dept as d    on d.DeptID = e.DeptID  where e.DeptID is null

O/P :-
DeptID	DeptName	EmpID	EmpName	Gender	Age	PhoneNumber	DeptID
4	PAYROLL	NULL	NULL	NULL	NULL	NULL	NULL
5	SECURITY	NULL	NULL	NULL	NULL	NULL	NULL

*/


/*	Full Join 
select d.DeptID,d.DeptName,e.EmpID,e.EmpName,e.Gender,e.Age,e.PhoneNumber,e.DeptID
from  dbo.emp as e  FULL join dbo.dept as d    on d.DeptID = e.DeptID where (d.DeptID is null OR e.DeptID is null)

*/