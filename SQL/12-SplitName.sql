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
BEGIN TRAN
GO

-- fix code
ALTER VIEW [dbo].[GetNewName]
/*
Steve Jones - Updated to return two names, not one
*/
AS
    SELECT TOP 1
		A.firstname,
		B.lastname 
	 FROM dbo.PeopleName AS a CROSS JOIN dbo.PeopleName AS b
	 ORDER BY NEWID()

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
	SELECT @cityname = CityName FROM dbo.GetNewCity AS cn
	SELECT @postalcode = gnz.Postalcode FROM dbo.GetNewZip AS gnz
	INSERT dbo.Customer
	  (FirstName, LastName, CustomerAddress, City, St, zip)
	VALUES
	  (@firstname, @lastname, @Addr, @cityname, 'CO', @postalcode)
	SELECT @custid = SCOPE_IDENTITY()
	INSERT dbo.OrderHeader(CustomerID, OrderDate, ShipDate)
	VALUES
	  (@custid, GETDATE(), DATEADD(MONTH, 1, GETDATE()))
	SELECT @firstname + ' ' + @lastname AS CustomerName, @firstname AS FirstName, @lastname AS LastName, @Addr AS Addr, @cityname AS City, 'CO' AS St, @postalcode AS Postal
END
GO
COMMIT 
GO


-- at this point, we can repoint applications to the new column(s)


-- stop the app
-- Find last new customer
-- check the data, look for this customer.
-- Note, firstname lastname populated. Customername matches from trigger execution
SELECT * FROM dbo.Customer AS c

-- Restart app
-- PRESS Splitname button (move to on)

