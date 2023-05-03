/*
Zero Downtime Demos

Rename a column and rename a table

Deployment 1
- Add a new column
- adjust code to use the new column, return both

Deployment 2
- Remove the new column
- rename the old one
- adjust code to only use the old column

Copyright 2022 Steve Jones
*/
/********************************************************************************************
*******************************************************************************************
     MAKE SURE FEATURE FLAG FLIPPED
*******************************************************************************************
*******************************************************************************************
*/
-- start a transaction
BEGIN TRAN

-- remove the computed column
ALTER TABLE dbo.OrderHeader DROP COLUMN OrderedByDate

IF @@ERROR <> 0
	ROLLBACK

-- rename the original
EXEC sp_rename @objname = 'dbo.OrderHeader.OrderDate' ,
@newname = 'OrderedByDate' ,
@objtype = 'column';
GO

GO
-- remove the column from the code
ALTER PROCEDURE dbo.GetOrder
	@OrderID INT 
AS
SELECT o.OrderID
     , o.CustomerID
     , o.OrderedByDate
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
ALTER PROCEDURE dbo.AddNewOrder
AS
BEGIN
    DECLARE @orderid INT
	, @custid int
	, @orderdate DATETIME
	, @shipdate datetime
	SELECT TOP 1 @custid = c.CustomerID FROM dbo.Customer AS c ORDER BY NEWID()
	SELECT @orderdate = DATEADD( DAY, ABS(CHECKSUM(NEWID())) / 1000000, '2020-01-01')
	SELECT @shipdate = DATEADD( DAY, ABS(CHECKSUM(NEWID())) / 1000000, '2020-02-01')
	INSERT dbo.OrderHeader
	  (CustomerID, OrderedByDate, ShipDate)
	VALUES
	  (@custid, @orderdate, @shipdate)
	SELECT @orderid = SCOPE_IDENTITY()
	SELECT @orderid AS OrderID, @custid AS CustomerID, @orderdate AS OrderedByDate, @shipdate AS ShipDate
END
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
	INSERT dbo.OrderHeader(CustomerID, OrderedByDate, ShipDate)
	VALUES
	  (@custid, GETDATE(), DATEADD(MONTH, 1, GETDATE()))
	SELECT @firstname AS FirstName, @lastname AS LastName, @Addr AS Addr, @cityname AS City, 'CO' AS St, @postalcode AS Postal
END
GO
CREATE OR ALTER PROCEDURE SalesReport
  @year INT
AS
BEGIN
    DECLARE @start DATETIME, @end DATETIME
	SELECT @start = DATETIMEFROMPARTS(@year, 1, 1, 1, 1, 0, 0)
	SELECT @end = DATEADD(YEAR, 1, @start)
	SELECT count (*) AS SaleCount
	 FROM dbo.OrderHeader AS oh
	 WHERE oh.OrderedByDate > @start
	 AND oh.OrderedByDate < @end
END
GO
COMMIT
GO

--**********************************************************
--**********************************************************
-- WE ARE NO LONGER BACKWARDS COMPATIBLE
--**********************************************************
--**********************************************************
 



-- cleanup if needed
/*
EXEC sp_rename @objname = 'dbo.OrderHeader.OrderedbyDate' ,
@newname = 'OrderDate' ,
@objtype = 'column';
GO
*/

-- cleanup for testing
--ALTER TABLE dbo.OrderHeader DROP COLUMN OrderedBy