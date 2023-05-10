@echo off
sqlcmd -S . -E -d master -Q "if not exists(select [name] from sys.databases where [name] = 'ZeroDowntime') create database ZeroDowntime"
echo "database created"

sqlcmd -S . -E -d master -Q "IF NOT EXISTS (SELECT * FROM master.sys.server_principals AS sp WHERE name = 'ClientUser')	CREATE LOGIN ClientUser WITH PASSWORD = 'Demo12#4'"
echo "login created"

sqlcmd -S . -E -d ZeroDowntime -Q "CREATE USER ClientUser FOR LOGIN ClientUser"
echo "user created"

sqlcmd -S . -E -d ZeroDowntime -Q "CREATE ROLE ClientApp"
echo "role created"

sqlcmd -S . -E -d ZeroDowntime -Q "ALTER ROLE ClientApp ADD MEMBER ClientUser"
echo "role altered"

flyway migrate -configFiles="./flyway.conf" -workingDirectory="E:\Documents\git\zerodowntime\Flyway" -url="jdbc:sqlserver://localhost;databaseName=ZeroDowntime;encrypt=true;integratedSecurity=true;trustServerCertificate=true" -enterprise -baselineOnMigrate=true -target=1 -outputType=json -outputFile="output.json" 
echo "baseline applied"

