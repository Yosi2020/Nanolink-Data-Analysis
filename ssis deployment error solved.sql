SELECT value_in_use
FROM sys.configurations
WHERE name = 'clr enabled';


ALTER DATABASE SSISDB SET TRUSTWORTHY ON;


USE master;
GO

CREATE ASYMMETRIC KEY IntegrationServicesKey
FROM EXECUTABLE FILE = 'C:\Program Files\Microsoft SQL Server\150\DTS\Binn\microsoft.sqlserver.integrationservices.server.dll';
GO

CREATE LOGIN IntegrationServicesLogin
FROM ASYMMETRIC KEY IntegrationServicesKey;
GO

GRANT UNSAFE ASSEMBLY TO IntegrationServicesLogin;
GO
