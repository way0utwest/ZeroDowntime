/*
Zero Downtime Demos

20 - Adding Auditing Columns NOT NULL

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
------------------------------------------------------
------------------------------------------------------
-- Deployment 2
------------------------------------------------------
------------------------------------------------------
-- fix the data
UPDATE dbo.OrderHeader 
SET CreateDate = OrderDate
, ModifiedDate = ShipDate
WHERE CreateDate IS NULL
GO
BEGIN TRAN
GO
-- clean up the proc
ALTER   PROCEDURE [dbo].[GetOrder]
	@OrderID INT 
AS
SELECT o.OrderID
     , o.CustomerID
     , o.OrderDate
     , o.ShipDate
     , c.CustomerID
--     , c.CustomerName
     , c.CustomerAddress
     , c.City
     , c.St
     , c.zip
     , c.FirstName
     , c.LastName
	 -- new columns
	 , o.CreateDate
	 , o.ModifiedDate
 FROM dbo.OrderHeader AS o
 INNER JOIN  dbo.Customer AS c ON c.CustomerID = o.CustomerID
 where o.OrderID = @orderID
GO

---------------------------------------------------------------------
---------------------------------------------------------------------
-- Optional
-- Deployment 3
---------------------------------------------------------------------
---------------------------------------------------------------------
ALTER TABLE dbo.OrderHeader ALTER COLUMN CreateDate DATETIME NOT NULL
ALTER TABLE dbo.OrderHeader ALTER COLUMN ModifiedDate DATETIME NOT NULL
GO
COMMIT

---------------------------------------------------------------------
---------------------------------------------------------------------
-- Flip the app toggle
-- see audit dates appear
---------------------------------------------------------------------
---------------------------------------------------------------------

