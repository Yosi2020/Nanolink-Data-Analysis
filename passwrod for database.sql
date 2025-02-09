-- Create a new database with a password
CREATE DATABASE MyDatabase;

ALTER DATABASE MyDatabase SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

ALTER DATABASE MyDatabase SET MULTI_USER;

ALTER LOGIN sa WITH PASSWORD = 'Eyosi123';

USE MyDatabase;

-- Create a new table in the database
CREATE TABLE MyTable (
  Id INT PRIMARY KEY,
  Name VARCHAR(50)
);

-- Insert some data into the table
INSERT INTO MyTable (Id, Name) VALUES (1, 'John');
INSERT INTO MyTable (Id, Name) VALUES (2, 'Jane');
INSERT INTO MyTable (Id, Name) VALUES (3, 'Bob');

-- Select all data from the table
SELECT * FROM MyTable;

USE MyDatabase;
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'eyosi123';

CREATE CERTIFICATE MyServerCert WITH SUBJECT = 'Certificate for My Server';

CREATE DATABASE ENCRYPTION KEY 
WITH ALGORITHM = AES_256 
ENCRYPTION BY SERVER CERTIFICATE MyServerCert;

ALTER DATABASE MyDatabase
SET ENCRYPTION ON

SELECT * FROM MyTable;

