@echo off
flyway migrate -configFiles="./flyway.conf" -workingDirectory="E:\Documents\git\zerodowntime\Flyway" -url="jdbc:sqlserver://localhost;databaseName=ZeroDowntime;encrypt=true;integratedSecurity=true;trustServerCertificate=true" -enterprise -baselineOnMigrate=true -target=5

echo "======================================"
echo "======================================"
echo "First Add Not Null deployment complete"
echo "======================================"
echo "======================================"
