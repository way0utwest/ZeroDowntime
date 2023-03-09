/*
Zero Downtime Demos

20 - Adding Auditing Columns NOT NULL

This script 
- Fixes early data
- Alters code

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
, ModifiedDate = OrderDate
WHERE CreateDate IS NULL
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
	 , o.CreateDate
	 , o.ModifiedDate
 FROM dbo.OrderHeader AS o
 INNER JOIN  dbo.Customer AS c ON c.CustomerID = o.CustomerID
 where o.OrderID = @orderID
GO


-- Flip the app toggle
