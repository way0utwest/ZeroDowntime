/*
Zero Downtime Demos

Adding a parameter to a procedure

Let's now make our proc expect the new params and not the old.

Copyright 2022 Steve Jones
*/
USE ZeroDowntime;
GO

CREATE OR ALTER PROCEDURE SalesReport @year  INT = null
                                    , @start DATETIME = NULL
                                    , @end   DATETIME = NULL
AS
BEGIN
  DECLARE
    @s DATETIME
  , @e DATETIME;
  IF @start IS NULL
  BEGIN
    SELECT @s = DATETIMEFROMPARTS (@year, 1, 1, 1, 1, 0, 0);
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
  , @end AS ReportEnd
  FROM dbo.OrderHeader AS oh
  WHERE
    oh.OrderedByDate     > @s
    AND oh.OrderedByDate < @e;
END;
GO

-- test this
EXEC dbo.SalesReport 2023;
EXEC dbo.SalesReport 2023, '1996-01-01', '1997-01-01';
EXEC dbo.SalesReport 2023, '1996-01-01';
GO