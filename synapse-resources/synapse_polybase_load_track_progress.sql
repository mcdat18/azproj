-- See all requests
SELECT * FROM sys.dm_pdw_exec_requests;

-- See a particular request identified by label
SELECT * FROM sys.dm_pdw_exec_requests as r
WHERE r.[label] = 'CTAS : Load [retail].[DimProduct]'

SELECT * FROM sys.dm_pdw_exec_requests as r
WHERE r.[label] = 'CTAS: Load [retail].[FactOnlineSales]'

-- To track bytes and files
SELECT
    r.command,
    s.request_id,
    r.status,
    count(distinct input_name) as nbr_files,
    sum(s.bytes_processed)/1024 kb_processed
FROM
    sys.dm_pdw_exec_requests r
    inner join sys.dm_pdw_dms_external_work s
        on r.request_id = s.request_id
WHERE
    r.[label] = 'CTAS : Load [retail].[DimProduct]' OR r.[label] = 'CTAS: Load [retail].[FactOnlineSales]'
GROUP BY
    r.command,
    s.request_id,
    r.status
ORDER BY
    nbr_files desc,
    kb_processed desc;

