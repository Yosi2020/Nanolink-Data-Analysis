
Create database Sport;

use Sport;

CREATE TABLE [dbo].[Players](
	[PlayerID] [int] NOT NULL primary key,
	[Position] [varchar](50) NULL,
	[JerseyNumber] [int] NULL,
	[StartDate] [date] NULL
) 

CREATE TABLE [dbo].[Coach](
	[CoachID] [int] NOT NULL PRIMARY KEY,
	[CoachName] [varchar](50) NULL,	[CoachType] [varchar](50) NULL,
	[StartDate] [datetime] NULL

)

--- players data 
INSERT INTO [dbo].[players]
 VALUES (1,'Running Back', 22, '1/1/2021');
 INSERT INTO [dbo].[players]
 VALUES (2,'Running Back', 20, '1/1/2020');
  INSERT INTO [dbo].[players]
 VALUES (3,'Running Back', 15, '1/1/2021');
  INSERT INTO [dbo].[players]
 VALUES (4,'Running Back', 45, '1/1/2021');
  INSERT INTO [dbo].[players]
 VALUES (5,'Running Back', 20, '1/1/2020');
  INSERT INTO [dbo].[players]
 VALUES (6,'Running Back', 20, '1/1/2020');
  INSERT INTO [dbo].[players]
 VALUES (7,'Running Back', 67, '1/1/2021');
  INSERT INTO [dbo].[players]
 VALUES (8,'Running Back', 7, '1/1/2020');
  INSERT INTO [dbo].[players]
 VALUES (11,'Running Back', 20, '1/1/2012');
  INSERT INTO [dbo].[players]
 VALUES (9,'Running Back', 2, '1/1/2021');
  INSERT INTO [dbo].[players]
 VALUES (10,'Running Back', 19, '1/1/2020');

 select * from [dbo].[Players];
--------------------------------------------------------

--- Coach data 

   INSERT INTO [dbo].[Coach]
 VALUES (1,'John Starks','Running back Coach', '1/1/2019');
 
  INSERT INTO [dbo].[Coach]
 VALUES (2,'John ','Running back Coach', '1/1/2020');
 
  INSERT INTO [dbo].[Coach]
 VALUES (3,'wonde','Running back Coach', '1/1/2021');
 
  INSERT INTO [dbo].[Coach]
 VALUES (4,'Bob','Running back Coach', '1/1/2020');
 
  INSERT INTO [dbo].[Coach]
 VALUES (5,'Starks','Running back Coach', '1/1/2019');
 
  INSERT INTO [dbo].[Coach]
 VALUES (6,'John Starks','Running back Coach', '1/1/2021');
 
  INSERT INTO [dbo].[Coach]
 VALUES (7,'John Starks','Running back Coach', '1/1/2021');
 
  INSERT INTO [dbo].[Coach]
 VALUES (8,'Smile','Running back Coach', '1/1/2021');
 
  INSERT INTO [dbo].[Coach]
 VALUES (9,'John Starks','Running back Coach', '1/1/2020');
 
  INSERT INTO [dbo].[Coach]
 VALUES (10,'Ali Starks','Running back Coach', '1/1/2020');
 
  INSERT INTO [dbo].[Coach]
 VALUES (11,' Frank','Running back Coach', '1/1/2021');
 
  INSERT INTO [dbo].[Coach]
 VALUES (12,'Josh Starks','Running back Coach', '1/1/2021')

 select * from [dbo].[Coach];

-- 1) Retrieve All Players with Jersey numbers in the 20’s

select * from [dbo].[Players] where JerseyNumber between 20 and 30;

--- 2) Retrive all CoachID lessthan 5

select * from [dbo].[Coach] where CoachID < 5;

--- 3) Retrive all coaches who joined the team 2021

select * from [dbo].[Players] where startDate Between 
'2021-01-01 00:00:00.000'and '2021-12-31 00:00:00.000';

--- 4) retrive all coaches who join 2020

select * from [dbo].[Coach] where startDate Between 
'2020-01-01 00:00:00.000'and '2020-12-31 00:00:00.000';

-- 5) retrive all players who join the team 2019

select * from [dbo].[Players] where startDate Between 
'2019-01-01 00:00:00.000'and '2019-12-31 00:00:00.000';

-- 6) retrive all coaches who joined the team 2020

select * from [dbo].[Coach] where startDate Between 
'2020-01-01 00:00:00.000'and '2020-12-31 00:00:00.000';

Select * From dbo.CoachWhere year(StartDate) = '2020'

Select * from [dbo].[Coach] where [StartDate]='2020'

-- 7) retrive all players with id > 5

select * from [dbo].[Players] where PlayerID > 5;

-- 8) RETRIVE ALL RUNNING BACKS

select * from [dbo].[Players] where Position = 'Running Back';

--- 9) Retrive all quarter back coaches

select * from [dbo].[Coach] where CoachType = 'Quarter Back Coaches';

-- 10) Create a player backup table (player_backup) using the SELECT INTO statement
SELECT * INTO player_backup FROM Players;

-- 11) Create a coach backup table (coach_backup) using the SELECT INTO statement
SELECT * INTO coach_backup FROM coach;