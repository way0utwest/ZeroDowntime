/*
Zero Downtime Demos

10 - Split Name

This script contains a common practice for splitting a name. This it not
the recommended way to do this, especially with larger data volumes.

Deployment 1
- add first name and last name columns
- move data
- delete old column


Copyright 2022 Steve Jones
*/
USE ZeroDowntime
GO
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Deployment 
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

-- This doesn't run
-- This doesn't cause issues in the app
BEGIN TRANSACTION
-- add new fields
ALTER TABLE dbo.Customer ADD FirstName VARCHAR(30), LastName VARCHAR(30)
GO
-- move data
UPDATE dbo.Customer
 SET FirstName = SUBSTRING(CustomerName, 1, CHARINDEX(' ', CustomerName)-1)
 , LastName = SUBSTRING(CustomerName,CHARINDEX(' ', CustomerName)+1, LEN(CustomerName) )

-- STOP RUNNING HERE

GO
-- remove the old columns
ALTER TABLE dbo.Customer
 DROP COLUMN CustomerName
GO
ROLLBACK
GO

-- Zero errors
-- However, the move data might be long.
-- IF there is another app needing customerName, am I sure it's updated?
-- Once I do this, I'm stuck.
