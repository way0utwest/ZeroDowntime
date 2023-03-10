/*
Zero Downtime Demos

Adding a parameter to a procedure

We want to change a procedure, SalesReport

Copyright 2022 Steve Jones
*/
USE ZeroDowntime
GO
-- Old code
CREATE OR ALTER PROCEDURE SalesReport
  @year INT
AS
BEGIN
    DECLARE @start DATETIME, @end DATETIME
	SELECT @start = DATETIMEFROMPARTS(@year, 1, 1, 1, 1, 0, 0)
	SELECT @end = DATEADD(YEAR, 1, @start)
	SELECT count (*) AS SaleCount, @end AS ReportEnd
	 FROM dbo.OrderHeader AS oh
	 WHERE oh.OrderedByDate > @start
	 AND oh.OrderedByDate < @end
END
GO
EXEC dbo.SalesReport 2023
GO

-- we want to change this to send in the start and end dates
-- typically, we might do this:
-- if we run this, things break
CREATE OR ALTER PROCEDURE SalesReport
  @start DATETIME
  , @end DATETIME
AS
BEGIN
	SELECT count (*) AS SaleCount, @end AS ReportEnd
	 FROM dbo.OrderHeader AS oh
	 WHERE oh.OrderedByDate > @start
	 AND oh.OrderedByDate < @end
	 GROUP BY oh.CustomerID
END
GO

-- However, this can break the application if not every call is updated. 
-- We can do better.
-- check app - errors for SalesReport.

-- fix
CREATE OR ALTER PROCEDURE SalesReport
  @year INT
AS
BEGIN
    DECLARE @start DATETIME, @end DATETIME
	SELECT @start = DATETIMEFROMPARTS(@year, 1, 1, 1, 1, 0, 0)
	SELECT @end = DATEADD(YEAR, 1, @start)
	SELECT count (*) AS SaleCount, @end AS ReportEnd
	 FROM dbo.OrderHeader AS oh
	 WHERE oh.OrderedByDate > @start
	 AND oh.OrderedByDate < @end
END
GO
