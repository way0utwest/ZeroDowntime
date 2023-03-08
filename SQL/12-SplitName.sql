/*
Zero Downtime Demos

12 - Split Name

This script contains the second of 3 deployments. This script will move the data.
This is separate as there might be issues, and we may potentially need to alter this
script and re-run this process

Deployment 1
- add first name and last name columns

Deployment 2
- move data

Deployment 3
- remove column
- drop triggers
- fix procedure

Copyright 2022 Steve Jones
*/
USE ZeroDowntime
GO
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- deployment 2 
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- move data
UPDATE dbo.Customer
 SET FirstName = SUBSTRING(CustomerName, 1, CHARINDEX(' ', CustomerName)-1)
 , LastName = SUBSTRING(CustomerName,CHARINDEX(' ', CustomerName)+1, LEN(CustomerName) )
-- select * from dbo.Customer
GO

-- at this point, we can repoint applications to the new column(s)

