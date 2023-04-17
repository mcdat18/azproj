

DROP PROCEDURE dbo.LogPipelineStart;
GO

CREATE PROCEDURE dbo.LogPipelineStart (
  @PipelineRunId UNIQUEIDENTIFIER
, @RunStartDateTime DATETIME
, @Comments NVARCHAR(1024) = NULL
) AS
INSERT INTO dbo.PipelineExecution (
  PipelineRunId
, RunStartDateTime
, Comments
) VALUES (
  @PipelineRunId
, @RunStartDateTime
, @Comments
);

SELECT SCOPE_IDENTITY() AS RunSeqNo;
GO

CREATE PROCEDURE dbo.LogPipelineEnd (
  @RunSeqNo INT
, @RunEndDateTime DATETIME
, @RunStatus VARCHAR(20)
, @FilesRead INT
, @RowsRead INT
, @RowsCopied INT
) AS
UPDATE dbo.PipelineExecution
SET RunEndDateTime = @RunEndDateTime
  , RunStatus = @RunStatus
  , FilesRead = @FilesRead
  , RowsRead = @RowsRead
  , RowsCopied = @RowsCopied
WHERE RunSeqNo = @RunSeqNo;
GO


CREATE TABLE dbo.PipelineExecutionT (
  RunSeqNo INT IDENTITY PRIMARY KEY
, PipelineRunId UNIQUEIDENTIFIER UNIQUE NOT NULL
, RunStartDateTime DATETIME NULL
, RunEndDateTime DATETIME NULL
, RunStatus NVARCHAR(20) NULL
, FilesRead INT NULL
, RowsRead INT NULL
, RowsCopied INT NULL
, Comments NVARCHAR(1024) NULL
);
GO

CREATE PROCEDURE dbo.LogPipelineExecution (
  @PipelineRunId UNIQUEIDENTIFIER
, @RunEndDateTime DATETIME
, @FilesRead INT
, @RowsRead INT
, @RowsCopied INT
) AS
INSERT INTO dbo.PipelineExecution (
  PipelineRunId
, RunEndDateTime
, FilesRead
, RowsRead
, RowsCopied
) VALUES (
  @PipelineRunId
, @RunEndDateTime
, @FilesRead
, @RowsRead
, @RowsCopied