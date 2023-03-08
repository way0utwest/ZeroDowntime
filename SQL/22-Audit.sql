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
-- Errors and NULLs, so let's fix.
ALTER TABLE dbo.OrderHeader
 DROP COLUMN CreateDate, ModifiedDate
GO


-- New deployment
BEGIN TRAN
GO
CREATE DEFAULT dbo.CurrentDate AS GETDATE();
GO
ALTER TABLE dbo.OrderHeader
 ADD CreateDate DATETIME NULL DEFAULT dbo.CurrentDate, ModifiedDate DATETIME NULL DEFAULT dbo.CurrentDate
GO
IF @@ERROR = 0
	COMMIT
ELSE 
	ROLLBACK
GO

SELECT TOP 20 
*
FROM dbo.OrderHeader AS oh
ORDER BY oh.OrderID desc
GO
 
-- inserts are working, but queries are not returning this info
-- what do we do?
-- Let's look at dbop.getOrder
EXEC dbo.GetOrder @OrderID = 10

-- check the code
-- Object Explorer, Modify





-- let's fix this, expand the *
-- Form is only using the OrderID, OrderDate, Customer Name fields
ALTER   PROCEDURE [dbo].[GetOrder]
	@OrderID INT 
AS
SELECT o.OrderID
     , o.OrderDate
     , c.CustomerName
 FROM dbo.OrderHeader AS o
 INNER JOIN  dbo.Customer AS c ON c.CustomerID = o.CustomerID
 where o.OrderID = @orderID

 -- things are working
 -- however, what about the early data?