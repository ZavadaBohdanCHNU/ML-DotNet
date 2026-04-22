Write-Host "Starting SQL Server container..."
docker-compose up -d

Write-Host "Waiting for SQL Server to initialize (20s)..."
Start-Sleep -Seconds 20

Write-Host "Copying DailyDemand.mdf to container..."
docker cp ./Data/DailyDemand.mdf bds_sqlserver:/var/opt/mssql/data/DailyDemand.mdf

Write-Host "Fixing permissions..."
docker exec -u root bds_sqlserver chown mssql:root /var/opt/mssql/data/DailyDemand.mdf

Write-Host "Attaching DailyDemand database..."
docker exec bds_sqlserver /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P 'Password_123!' -N -C -Q "CREATE DATABASE [DailyDemand] ON (FILENAME = '/var/opt/mssql/data/DailyDemand.mdf') FOR ATTACH_REBUILD_LOG"

Write-Host "Database attached successfully!"
