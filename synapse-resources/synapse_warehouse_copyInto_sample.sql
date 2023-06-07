COPY INTO [dbo].[Date]
FROM 'https://nytaxiblob.blob.core.windows.net/2013/Date'
WITH
(
    FILE_TYPE = 'CSV',
	FIELDTERMINATOR = ',',
	FIELDQUOTE = ''
)
OPTION (LABEL = 'COPY : Load [dbo].[Date] - Taxi dataset');


COPY INTO [dbo].[Geography]
FROM 'https://nytaxiblob.blob.core.windows.net/2013/Geography'
WITH
(
    FILE_TYPE = 'CSV',
	FIELDTERMINATOR = ',',
	FIELDQUOTE = ''
)
OPTION (LABEL = 'COPY : Load [dbo].[Geography] - Taxi dataset');

COPY INTO [dbo].[HackneyLicense]
FROM 'https://nytaxiblob.blob.core.windows.net/2013/HackneyLicense'
WITH
(
    FILE_TYPE = 'CSV',
	FIELDTERMINATOR = ',',
	FIELDQUOTE = ''
)
OPTION (LABEL = 'COPY : Load [dbo].[HackneyLicense] - Taxi dataset');

COPY INTO [dbo].[Medallion]
FROM 'https://nytaxiblob.blob.core.windows.net/2013/Medallion'
WITH
(
    FILE_TYPE = 'CSV',
	FIELDTERMINATOR = ',',
	FIELDQUOTE = ''
)
OPTION (LABEL = 'COPY : Load [dbo].[Medallion] - Taxi dataset');

COPY INTO [dbo].[Time]
FROM 'https://nytaxiblob.blob.core.windows.net/2013/Time'
WITH
(
    FILE_TYPE = 'CSV',
	FIELDTERMINATOR = ',',
	FIELDQUOTE = ''
)
OPTION (LABEL = 'COPY : Load [dbo].[Time] - Taxi dataset');

COPY INTO [dbo].[Weather]
FROM 'https://nytaxiblob.blob.core.windows.net/2013/Weather'
WITH
(
    FILE_TYPE = 'CSV',
	FIELDTERMINATOR = ',',
	FIELDQUOTE = '',
	ROWTERMINATOR='0X0A'
)
OPTION (LABEL = 'COPY : Load [dbo].[Weather] - Taxi dataset');

COPY INTO [dbo].[Trip]
FROM 'https://nytaxiblob.blob.core.windows.net/2013/Trip2013'
WITH
(
    FILE_TYPE = 'CSV',
	FIELDTERMINATOR = '|',
	FIELDQUOTE = '',
	ROWTERMINATOR='0X0A',
	COMPRESSION = 'GZIP'
)
OPTION (LABEL = 'COPY : Load [dbo].[Trip] - Taxi dataset');

-- Use Dynamic Management Views to check load status

SELECT  r.[request_id]                           
,       r.[status]                               
,       r.resource_class                         
,       r.command
,       sum(bytes_processed) AS bytes_processed
,       sum(rows_processed) AS rows_processed
FROM    sys.dm_pdw_exec_requests r
              JOIN sys.dm_pdw_dms_workers w
                     ON r.[request_id] = w.request_id
WHERE [label] = 'COPY : Load [dbo].[Date] - Taxi dataset' OR
    [label] = 'COPY : Load [dbo].[Geography] - Taxi dataset' OR
    [label] = 'COPY : Load [dbo].[HackneyLicense] - Taxi dataset' OR
    [label] = 'COPY : Load [dbo].[Medallion] - Taxi dataset' OR
    [label] = 'COPY : Load [dbo].[Time] - Taxi dataset' OR
    [label] = 'COPY : Load [dbo].[Weather] - Taxi dataset' OR
    [label] = 'COPY : Load [dbo].[Trip] - Taxi dataset' 
and session_id <> session_id() and type = 'WRITER'
GROUP BY r.[request_id]                           
,       r.[status]                               
,       r.resource_class                         
,       r.command;

-- view all system queries

SELECT * FROM sys.dm_pdw_exec_requests;