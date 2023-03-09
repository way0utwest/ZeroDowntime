/*
Zero Downtime Demos

10 - Demo errors

This script 
- removes a field from an object, which errors out the application
- Fixes the error

Copyright 2022 Steve Jones
*/
-- remove a needed field
ALTER PROCEDURE dbo.GetOrder
	@OrderID INT 
AS
SELECT o.OrderID, o.CustomerID, o.OrderDate, o.ShipDate
 FROM dbo.OrderHeader AS o
 INNER JOIN  dbo.Customer AS c ON c.CustomerID = o.CustomerID
 where o.OrderID = @orderID
GO

-- check the app


-- fix things
ALTER PROCEDURE dbo.GetOrder
	@OrderID INT 
AS
SELECT o.OrderID, o.CustomerID, o.OrderDate, o.ShipDate, c.CustomerName
 FROM dbo.OrderHeader AS o
 INNER JOIN  dbo.Customer AS c ON c.CustomerID = o.CustomerID
 where o.OrderID = @orderID
GO
