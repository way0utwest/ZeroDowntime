@echo off
flyway migrate -configFiles="./flyway.conf" -workingDirectory="E:\Documents\git\zerodowntime\Flyway" -url="jdbc:sqlserver://localhost;databaseName=ZeroDowntime;encrypt=true;integratedSecurity=true;trustServerCertificate=true" -enterprise -baselineOnMigrate=true -target=3
echo "data movement complete"
echo "flip Split name flag"