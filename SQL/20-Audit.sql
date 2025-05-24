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

-- We could add Not Null columns
ALTER TABLE dbo.OrderHeader
ADD
  CreateDate DATETIME NOT NULL CONSTRAINT DF_Getdate DEFAULT GETDATE ()
GO
ALTER TABLE dbo.OrderHeader
ADD
  ModifiedDate DATETIME NOT NULL CONSTRAINT DF_GetDateMod DEFAULT GETDATE();
GO
-- check the table
SELECT TOP 20
*
FROM dbo.OrderHeader AS oh
ORDER BY oh.OrderID desc
GO
-- We might not want the dates to be these defaults
-- We can update over time, but users will see the strange dates while we do
-- We also don't know our progress if complex logic is used to set a date.
-- Is it the orderdate? Or is it supposed to be something else?

-- Problems, so let's fix.
ALTER TABLE dbo.OrderHeader DROP CONSTRAINT DF_Getdate
go
ALTER TABLE dbo.OrderHeader DROP CONSTRAINT DF_GetdateMod
GO
ALTER TABLE dbo.OrderHeader
 DROP COLUMN CreateDate, ModifiedDate
GO
-- Check app

-- Let's do this better
-- Next script