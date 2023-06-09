/*
Zero Downtime Demos

Adding a parameter to a procedure

Let's make a backwards compatible change across 3 deployments

Deployment 1
- Add new optional parameters
- change logic to prefer the old parameter

Deployment 2
- make the old parameter optional
- change logic to prefer the new parameter

Deployment 3
- Remove the old parameter
- remove logic related to old parameter

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
  SELECT @e = DATEADD (YEAR, 1, @s);
END;
ELSE
BEGIN
  SELECT @s = @start, @e = @end;
END;
 	SELECT count (*) AS SaleCount, @e AS ReportEnd
  	 FROM dbo.OrderHeader AS oh
   	 WHERE oh.OrderedByDate > @s
   	 AND oh.OrderedByDate < @e
END
GO
EXEC dbo.SalesReport 2023
GO
-- Proc button is "using year". This means the proc all:
-- passes in year from year text box
-- passes in NULL For start and end parameters
SELECT 'Flip Proc toggle to Prefer Year'
GO
