/*
Zero Downtime Demos

20 - Split Name

This script contains deployment 3 of 3. This is the cleanup script
for this process.

Deployment 1
- add first name and last name columns

Deployment 2
- add triggers
- fix procedure
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
-- deployment 1
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- add new fields
ALTER TABLE dbo.Customer ADD FirstName VARCHAR(30), LastName VARCHAR(30)
GO

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- deployment 2 (optionally)
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- keep fields in sync
CREATE TRIGGER tri_Customer ON dbo.Customer FOR INSERT
AS
BEGIN
    UPDATE dbo.Customer
	SET FirstName = SUBSTRING(i.CustomerName, 1, CHARINDEX(' ', i.CustomerName)-1)
		, LastName = SUBSTRING(i.CustomerName,CHARINDEX(' ', i.CustomerName)+1, LEN(i.CustomerName) )
	FROM inserted i
	WHERE i.CustomerID = dbo.Customer.CustomerID
	AND i.firstname IS null
    UPDATE dbo.Customer
	SET CustomerName = i.FirstName + ' ' + i.LastName
	FROM inserted i
	WHERE i.CustomerID = dbo.Customer.CustomerID
	AND i.CustomerName IS null
END
GO
CREATE TRIGGER tru_Customer ON dbo.Customer FOR UPDATE
AS
BEGIN
  IF UPDATE(CustomerName)
    UPDATE dbo.Customer
	SET FirstName = SUBSTRING(i.CustomerName, 1, CHARINDEX(' ', i.CustomerName)-1)
		, LastName = SUBSTRING(i.CustomerName,CHARINDEX(' ', i.CustomerName)+1, LEN(i.CustomerName) )
	FROM inserted i
	WHERE i.CustomerID = dbo.Customer.CustomerID
  IF UPDATE(FirstName) OR UPDATE(LastName)
    UPDATE dbo.Customer
	SET CustomerName = i.FirstName + ' ' + i.LastName
	FROM inserted i
	WHERE i.CustomerID = dbo.Customer.CustomerID
END
GO
-- change our procedure
CREATE OR ALTER PROCEDURE dbo.GetOrder
	@OrderID INT 
AS
SELECT o.OrderID
     , o.CustomerID
     , o.OrderDate
     , o.ShipDate
     , c.CustomerID
     , c.CustomerName
     , c.CustomerAddress
     , c.City
     , c.St
     , c.zip
     , c.FirstName
     , c.LastName
 FROM dbo.OrderHeader AS o
 INNER JOIN  dbo.Customer AS c ON c.CustomerID = o.CustomerID
 where o.OrderID = @orderID
GO
-- move data
UPDATE dbo.Customer
 SET FirstName = SUBSTRING(CustomerName, 1, CHARINDEX(' ', CustomerName)-1)
 , LastName = SUBSTRING(CustomerName,CHARINDEX(' ', CustomerName)+1, LEN(CustomerName) )
-- select * from dbo.Customer
GO

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- deployment 3
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- remove the old columns
ALTER TABLE dbo.Customer
 DROP COLUMN FirstName, LastName
GO
-- drop triggers
DROP TRIGGER tri_Customer
GO
DROP TRIGGER tru_Customer
GO
-- clean up the proc
CREATE OR ALTER PROCEDURE dbo.GetOrder
	@OrderID INT 
AS
SELECT o.OrderID
     , o.CustomerID
     , o.OrderDate
     , o.ShipDate
     , c.CustomerID
     , c.CustomerName
     , c.CustomerAddress
     , c.City
     , c.St
     , c.zip
     , c.FirstName
     , c.LastName
 FROM dbo.OrderHeader AS o
 INNER JOIN  dbo.Customer AS c ON c.CustomerID = o.CustomerID
 where o.OrderID = @orderID
GO
-- This should include removing feature flags and code as well from applications