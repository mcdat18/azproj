USE [CDEV_DB]
go
SET ansi_nulls ON
go
SET quoted_identifier ON
go
CREATE TABLE [dbo].[pipeline_sql_advload]
  (
    [parameter_id]                       [INT] IDENTITY(1, 1) NOT NULL,
     [server_name]                        [NVARCHAR](500) NULL,
     [src_type]                           [NVARCHAR](500) NULL,
     [src_schema]                         [NVARCHAR](500) NULL,
     [src_db]                             [NVARCHAR](500) NULL,
     [src_name]                           [NVARCHAR](500) NULL,
     [dst_type]                           [NVARCHAR](500) NULL,
     [dst_schema]                         [NVARCHAR](500) NULL,
     [dst_name]                           [NVARCHAR](500) NULL,
     [include_pipeline_flag]              [NVARCHAR](500) NULL,
     [partition_field]                    [NVARCHAR](500) NULL,
     [process_type]                       [NVARCHAR](500) NULL,
     [priority_lane]                      [NVARCHAR](500) NULL,
     [pipeline_date]                      [NVARCHAR](500) NULL,
     [pipeline_status]                    [NVARCHAR](500) NULL,
     [load_synapse]                       [NVARCHAR](500) NULL,
     [load_frequency]                     [NVARCHAR](500) NULL,
     [dst_folder]                         [NVARCHAR](500) NULL,
     [file_type]                          [NVARCHAR](500) NULL,
     [lake_dst_folder]                    [NVARCHAR](500) NULL,
     [spark_flag]                         [NVARCHAR](500) NULL,
     [distribution_type]                  [NVARCHAR](500) NULL,
     [load_sqldw_etl_pipeline_date]       [DATETIME] NULL,
     [load_sqldw_etl_pipeline_status]     [NVARCHAR](500) NULL,
     [load_sqldw_curated_pipeline_date]   [DATETIME] NULL,
     [load_sqldw_curated_pipeline_status] [NVARCHAR](500) NULL,
     [load_delta_pipeline_date]           [DATETIME] NULL,
     [load_delta_pipeline_status]         [NVARCHAR](500) NULL,
     PRIMARY KEY CLUSTERED ( [parameter_id] ASC )WITH (statistics_norecompute =
     OFF, ignore_dup_key = OFF) ON [PRIMARY]
  )
ON [PRIMARY]
go