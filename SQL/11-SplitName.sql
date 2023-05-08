/*
Zero Downtime Demos

11 - Split Name

This script contains deployment 1 of 3 for splitting a column into two new columns.
In this script, only the new columns are added.

Deployment 1
- add first name and last name columns
- add triggers
- fix procedure

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
-- deployment 1
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

BEGIN TRAN

-- add new fields
ALTER TABLE dbo.Customer
ADD FirstName VARCHAR(30) NULL, 
    LastName VARCHAR(30) NULL
GO

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- deployment 1 (optionally)
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
	 -- new columns added
     , c.FirstName
     , c.LastName
 FROM dbo.OrderHeader AS o
 INNER JOIN  dbo.Customer AS c ON c.CustomerID = o.CustomerID
 where o.OrderID = @orderID
GO

COMMIT

/*
check the tables


select * from customer
*/