/*
Zero Downtime Demos

20 - Adding Auditing Columns NOT NULL

This script 
- Changes the OrderHeader to add auditing columns
- Sets defaults

Copyright 2022 Steve Jones
*/
USE ZeroDowntime
GO
-- we want to add auditing columns
-- this would work for any column
ALTER TABLE dbo.OrderHeader
 ADD CreateDate DATETIME NOT NULL,
 ModifiedDate DATETIME NOT null
GO
-- we can't do this
-- We could add a default
-- We could use VALUES but potentially locking issues
-- We also might have more complex decisions on what to do here.

-- Let's add null columns
ALTER TABLE dbo.OrderHeader
 ADD CreateDate DATETIME NULL, ModifiedDate DATETIME null
GO

-- check the table
SELECT TOP 20 
*
FROM dbo.OrderHeader AS oh
ORDER BY oh.OrderID desc
GO
-- NULLs, so let's fix.
ALTER TABLE dbo.OrderHeader
 DROP COLUMN CreateDate, ModifiedDate
GO

-- Check app

-- Let's do this better
-- Next script