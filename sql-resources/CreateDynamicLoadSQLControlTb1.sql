USE [CDEV_DB]
go
SET ansi_nulls ON
go
SET quoted_identifier ON
go
CREATE TABLE [dbo].[pipeline_sql_load]
  (
     [parameter_id]  [INT] IDENTITY(1, 1) NOT NULL,
     [table_name]    [NVARCHAR](500) NULL,
     [table_catalog] [NVARCHAR](500) NULL,
     [process_type]  [NVARCHAR](500) NULL,
     PRIMARY KEY CLUSTERED ( [parameter_id] ASC )WITH (pad_index = OFF,
     statistics_norecompute = OFF, ignore_dup_key = OFF, allow_row_locks = on,
     allow_page_locks = on, optimize_for_sequential_key = OFF) ON [PRIMARY]
  )
ON [PRIMARY]
go