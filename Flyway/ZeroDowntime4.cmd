@echo off
flyway migrate -configFiles="./flyway.conf" -workingDirectory="E:\Documents\git\zerodowntime\Flyway" -url="jdbc:sqlserver://localhost;databaseName=ZeroDowntime;encrypt=true;integratedSecurity=true;trustServerCertificate=true" -enterprise -baselineOnMigrate=true -target=4
echo "Split Name flag no longer working"