/*
Zero Downtime Demos

Adding a parameter to a procedure

Let's now make our proc expect the new params and not the old.

Deployment 1
- add new optional parameters
- change logic to prefer the new parameter

Deployment 2
- make the old parameter optional
- change logic to prefer the new parameter

Deployment 3
- Remove the old parameter
- remove logic related to old parameter


Copyright 2022 Steve Jones
*/
USE ZeroDowntime;
GO
-- year parameter no longer required
CREATE OR ALTER PROCEDURE SalesReport @year  INT = NULL
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
  , @e AS ReportEnd
  FROM dbo.OrderHeader AS oh
  WHERE
    oh.OrderedByDate     > @s
    AND oh.OrderedByDate < @e;
END;
GO
-- flip Proc button to "prefer year". This means the proc all:
-- passes in year value from text box
-- passes in null values for start and end parameters

-- test this
-- prefer year
EXEC dbo.SalesReport 2023;
EXEC dbo.SalesReport 2023, NULL, null
-- prefer date
EXEC dbo.SalesReport 2023, '1996-01-01', '1997-01-01';
EXEC dbo.SalesReport 2023, '1996-01-01';
EXEC dbo.SalesReport @start = '1996-01-01';
GO

-- flip Proc button to "prefer date". This means the proc all:
-- passes in null for year value 
-- passes in textbox values for start and end parameters
