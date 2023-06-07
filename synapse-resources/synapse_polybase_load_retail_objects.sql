-- A: Create a master key.
-- Only necessary if one does not already exist.
-- Required to encrypt the credential secret in the next step.

CREATE MASTER KEY ENCRYPTION BY PASSWORD='3ust4N0w+J@lap3N0+';

-- B: Create a database scoped credential
-- IDENTITY: Provide any string, it is not used for authentication to Azure storage.
-- SECRET: Provide your Azure storage account key.

CREATE DATABASE SCOPED CREDENTIAL AzureStorageMI
WITH IDENTITY = 'MANAGED IDENTITY';

-- C: Create an external data source
-- TYPE: HADOOP - PolyBase uses Hadoop APIs to access data in Azure blob storage.
-- LOCATION: Provide Azure storage account name and blob container name.
-- CREDENTIAL: Provide the credential created in the previous step.

CREATE EXTERNAL DATA SOURCE AzureStorage
WITH (
    TYPE = HADOOP,
    LOCATION = 'abfss://bronze@mcdedevdlake.dfs.core.windows.net',
    CREDENTIAL = AzureStorageMI
);
GO

CREATE EXTERNAL DATA SOURCE DlakeDevBronze
WITH (
    TYPE = HADOOP,
    LOCATION = 'abfss://bronze@mcdedevdlake.dfs.core.windows.net',
    CREDENTIAL = AzureStorageMI
);

CREATE EXTERNAL FILE FORMAT TextFileFormat
WITH
(   FORMAT_TYPE = DELIMITEDTEXT
,    FORMAT_OPTIONS    (   FIELD_TERMINATOR = '|'
                    ,    STRING_DELIMITER = ''
                    ,    DATE_FORMAT         = 'yyyy-MM-dd HH:mm:ss.fff'
                    ,    USE_TYPE_DEFAULT = FALSE
                    )
);

CREATE SCHEMA [retailSTG]
GO

