/*
Zero Downtime Demos

Adding a parameter to a procedure

Remove the old proc. 
NOTE: The app must rev first

Copyright 2022 Steve Jones
*/
USE ZeroDowntime;
GO

CREATE OR ALTER PROCEDURE SalesReport @start DATETIME = NULL
                                    , @end   DATETIME = NULL
AS
BEGIN
  DECLARE
    @s DATETIME
  , @e DATETIME;
  IF @start IS NULL
  BEGIN
    SELECT @s = DATETIMEFROMPARTS (YEAR(GETDATE()), 1, 1, 1, 1, 0, 0);
    SELECT @e = DATEADD (YEAR, 1, @s);
  END;
  ELSE
  BEGIN
    SELECT @s = @start;
    IF @end IS NULL
      SELECT @e = DATEADD (YEAR, 1, @s);
    ELSE
      SELECT @e = @end;
  END;
  SELECT
    COUNT (*) AS SaleCount
  , @e AS ReportEnd
  FROM dbo.OrderHeader AS oh
  WHERE
    oh.OrderedByDate     > @s
    AND oh.OrderedByDate < @e;
END;
GO

-- test this
EXEC dbo.SalesReport 
EXEC dbo.SalesReport '1996-01-01'
EXEC dbo.SalesReport @start = '1996-01-01';
EXEC dbo.SalesReport @start = '2023-01-01';
GO