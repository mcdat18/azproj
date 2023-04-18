USE [CDEV_DB]
go
SET ansi_nulls ON
go
SET quoted_identifier ON
go

CREATE TABLE [dbo].[db_pipeline_metadata]
   (
    [parameter_id]                       [INT] IDENTITY(1, 1) NOT NULL,
    [src_db]                             [NVARCHAR](500) NULL,
    [src_schema]                         [NVARCHAR](500) NULL,
    [src_table]                           [NVARCHAR](500) NULL,
    [lake_dst_folder]                    [NVARCHAR](500) NULL,
    [include_pipeline_flag]              [NVARCHAR](500) NULL,
    [pipeline_date]                      [NVARCHAR](500) NULL,
    [pipeline_status]                    [NVARCHAR](500) NULL,
    [load_frequency]                     [NVARCHAR](500) NULL,
    [load_status]                             [NVARCHAR](500) NULL,
     PRIMARY KEY CLUSTERED ( [parameter_id] ASC )WITH (statistics_norecompute =
     OFF, ignore_dup_key = OFF) ON [PRIMARY]
  )
ON [PRIMARY]
go

DROP TABLE [dbo].[db_pipeline_metadata]