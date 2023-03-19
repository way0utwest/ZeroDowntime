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
-- deployment 3
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
--
-- ****************************************************************
-- ****************************************************************
--                        BEFORE RUNNING THIS!!!!!!!!!!!!!!
-- ****************************************************************
-- ****************************************************************
--   Toggle the app feature flag
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------



-- remove the old columns
ALTER TABLE dbo.Customer
 DROP COLUMN CustomerName
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
--     , c.CustomerName
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
ALTER   PROCEDURE [dbo].[AddNewCustomer]
AS
BEGIN
    DECLARE @firstname VARCHAR(100), @lastname VARCHAR(100)
	, @Addr VARCHAR(50)
	, @cityname VARCHAR(30)
	, @postalcode VARCHAR(5)
	, @custid int
	SELECT @firstname = firstname, @lastname = lastname FROM dbo.GetNewName AS gnn
	SELECT @Addr = gna.Addr FROM dbo.GetNewAddress AS gna
	SELECT @cityname = CityName FROM dbo.CityName AS cn
	SELECT @postalcode = gnz.Postalcode FROM dbo.GetNewZip AS gnz
	INSERT dbo.Customer
	  (FirstName, LastName, CustomerAddress, City, St, zip)
	VALUES
	  (@firstname, @lastname, @Addr, @cityname, 'CO', @postalcode)
	SELECT @custid = SCOPE_IDENTITY()
	INSERT dbo.OrderHeader(CustomerID, OrderDate, ShipDate)
	VALUES
	  (@custid, GETDATE(), DATEADD(MONTH, 1, GETDATE()))
	SELECT @firstname AS FirstName, @lastname AS LastName, @Addr AS Addr, @cityname AS City, 'CO' AS St, @postalcode AS Postal
END
GO
-- This should include removing feature flags and code as well from applications
