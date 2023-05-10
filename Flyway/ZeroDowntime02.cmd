@echo off
flyway migrate -configFiles="./flyway.conf" -workingDirectory="E:\Documents\git\zerodowntime\Flyway" -url="jdbc:sqlserver://localhost;databaseName=ZeroDowntime;encrypt=true;integratedSecurity=true;trustServerCertificate=true" -enterprise -baselineOnMigrate=true -target=2
rem output "schema created" to the console
echo "schema created"
