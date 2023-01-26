/*

Zero Downtime Demos

01 - Create database

This script creates a new database and then adds a login and user for the demos.
A role is created as well for the demos.

Copyright 2022 Steve Jones
*/
-- Create new database
CREATE DATABASE ZeroDowntime
GO
IF NOT EXISTS (SELECT * FROM master.sys.server_principals AS sp
 WHERE name = 'ClientUser')
	CREATE LOGIN ClientUser WITH PASSWORD = 'Demo12#4'
GO
USE ZeroDowntime
GO
CREATE USER ClientUser FOR LOGIN ClientUser
GO
CREATE ROLE ClientApp
GO
ALTER ROLE ClientApp ADD MEMBER ClientUser
GO
