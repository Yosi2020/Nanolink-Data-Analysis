
-- the read is hidden for other sql file
begin transaction 

INSERT INTO dbo.Dept (DeptID, DeptName)
select 10, 'eyu'

-- erase all data modifications made from the start of the transaction or to a savepoint 
rollback transaction

-- permanently save 
commit transaction

select * from dbo.Dept

/*
COMMIT − to save the changes.
ROLLBACK − to roll back the changes.
SAVEPOINT − creates points within the groups of transactions in which to ROLLBACK.
SET TRANSACTION − Places a name on a transaction.*/