/*
Zero Downtime Demos

Adding a parameter to a procedure

Let's make a backwards compatible change.

Copyright 2022 Steve Jones
*/
USE ZeroDowntime
GO
CREATE OR ALTER PROCEDURE SalesReport
  @year INT
  , @start DATETIME = NULL
  , @end DATETIME = NULL
AS
BEGIN
    DECLARE @s DATETIME, @e DATETIME
IF @start IS NULL
BEGIN
  SELECT @s = DATETIMEFROMPARTS (@year, 1, 1, 1, 1, 0, 0);
  SELECT @e = DATEADD (YEAR, 1, @start);
END;
ELSE
BEGIN
  SELECT @s = @start, @e = @end;
END;
 	SELECT count (*) AS SaleCount, @end AS ReportEnd
  	 FROM dbo.OrderHeader AS oh
   	 WHERE oh.OrderedByDate > @s
   	 AND oh.OrderedByDate < @e
GO
EXEC dbo.SalesReport 2023
GO

