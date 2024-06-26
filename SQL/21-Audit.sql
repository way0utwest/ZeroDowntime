/*
Zero Downtime Demos

21 - Adding Auditing Columns NOT NULL

Deployment 1
- add new columns as null

Deployment 2
- Fixes early data
- Alters code
- Set columns not null

Copyright 2022 Steve Jones
*/
USE ZeroDowntime
GO
-- New deployment
BEGIN TRAN
GO
ALTER TABLE dbo.OrderHeader
 ADD CreateDate DATETIME NULL CONSTRAINT dfCreateDate DEFAULT GETDATE(),
     ModifiedDate DATETIME NULL CONSTRAINT dfModifiedDate DEFAULT GETDATE()
GO
IF @@ERROR = 0
	COMMIT
ELSE 
	ROLLBACK
GO

-- check app
-- Errors?

SELECT 
*
FROM dbo.OrderHeader AS oh
ORDER BY oh.OrderID desc
GO
 
-- inserts are working, but queries are not returning this info
-- what do we do?
-- Let's look at dbo.getOrder
EXEC dbo.GetOrder @OrderID = 10

 -- things are working
 -- however, what about the early data?