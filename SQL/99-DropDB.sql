/*

Zero Downtime Demos

99 - DROP database

This script creates a new database and then adds a login and user for the demos.
A role is created as well for the demos.

Copyright 2022 Steve Jones
*/
-- Create new database
USE master
GO
ALTER DATABASE ZeroDowntime SET SINGLE_USER WITH ROLLBACK IMMEDIATE; 
GO
DROP DATABASE ZeroDowntime 
GO

