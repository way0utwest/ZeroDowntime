/*
Zero Downtime Demos

Rename a column and rename a table

Deployment 1 - Add a new column


Copyright 2022 Steve Jones
*/

BEGIN TRANSACTION
-- add a new column
-- computed, no space needed
ALTER TABLE dbo.OrderHeader 
  ADD OrderedByDate AS OrderDate;
GO
-- fix procedure to use the new column
-- keep old column
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
	  (CustomerID, OrderDate, ShipDate)
	VALUES
	  (@custid, @orderdate, @shipdate)
	SELECT @orderid = SCOPE_IDENTITY()
	-- add new column to result
	SELECT @orderid AS OrderID,
		   @custid AS CustomerID,
		   @orderdate AS OrderDate,
		   @shipdate AS ShipDate,
		   @orderdate AS OrderedByDate;
END
GO
-- fix procedure to use the new column
-- keep old column
ALTER PROCEDURE dbo.GetOrder
	@OrderID INT 
AS
SELECT o.OrderID
     , o.CustomerID
     , o.OrderDate
     , o.ShipDate
     , o.OrderedByDate
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
COMMIT
GO



-- check the table
SELECT TOP 10 * FROM dbo.OrderHeader AS oh

-- In app
-- click "Rename button in client
-- just works, note result name of data changes (OrderDate -> OrderedByDate)

-- cleanup for testing
--ALTER TABLE dbo.OrderHeader DROP COLUMN OrderedBy