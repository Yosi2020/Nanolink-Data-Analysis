use ETHIOPIADB

begin transaction   --- begin bank

Insert into [dbo].[Dept] (DeptID, DeptName)
select 25, 'Mahi'   --- 5k$ insert

commit transaction  ---- save .... this point savepoint/checkpoint

begin transaction   ---- begin transaction ---- ATM 2k$

Insert into [dbo].[Dept] (DeptID, DeptName)
select 50, 'Hilina'    ---- withdraw 1K$  ..... remind 4k$ 

commit transaction  ---save ..... this point save point/check point ........ on ATM 1K$

begin transaction   ---- begin trancation  ---- ATM 1K$

Insert into [dbo].[Dept] (DeptID, DeptName) 
select 75, 'babu'   ---- withdraw 3K$      ...... Remind 1k$

rollback transaction   ---- bank remind 1k$....... not withdraw 3K$   == 4k$ 