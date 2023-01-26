/*
Zero Downtime Demos

Rename a column and rename a table

This script contains multiple items, each of which may need to be deployed separately

Deployment 1

Deployment 2

Deployment 3

Copyright 2022 Steve Jones
*/

-- sp_rename
EXEC sp_rename @objname = 'dbo.OrderHeader.OrderDate' ,
@newname = 'OrderedByDate' ,
@objtype = 'column';
GO


EXEC sp_rename @objname = 'dbo.OrderHeader.OrderedbyDate' ,
@newname = 'OrderDate' ,
@objtype = 'column';
GO
