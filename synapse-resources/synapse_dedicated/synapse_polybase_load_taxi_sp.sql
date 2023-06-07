CREATE SCHEMA nyctSTG;
GO
CREATE SCHEMA nyct;
GO

CREATE PROC [nyct].[sp_create_table_nyctaxi]
@table_name varchar(100),
@distribution varchar(100),
@index nvarchar(100)
AS
BEGIN
    DECLARE @schema nvarchar(4000)

    SET @schema = N'[VendorID] varchar(10) NULL,
    [tpep_pickup_datetime] datetime NOT NULL,
    [tpep_dropoff_datetime] datetime NOT NULL,
    [passenger_count] int  NULL,
    [trip_distance] float  NULL,
    [RateCodeID] int NULL,
    [store_and_fwd_flag] varchar(3) NULL,
    [PULocationID] int NULL,
    [DOLocationID] int NULL,
    [payment_type] int NULL,
    [fare_amount] money NULL,
    [extra] money NULL,
    [mta_tax] money NULL,
    [tip_amount] money NULL,
    [tolls_amount] money NULL,
    [improvement_surcharge] money NULL,
    [total_amount] money NULL,
    [congestion_surcharge] money NULL'

    -- Drop table if exists
    IF OBJECT_ID(@table_name) IS NOT NULL
    BEGIN
        DECLARE @drop_table nvarchar(4000)
        SET @drop_table = N'DROP TABLE ' + @table_name
        EXECUTE sp_executesql @drop_table
    END

    -- Create table with proper schema
    DECLARE @create_table nvarchar(4000)

    SET @create_table = N'CREATE TABLE ' + @table_name + '( ' + @schema + ') WITH (DISTRIBUTION = ' + @distribution + ',' + @index + ')'

    EXECUTE sp_executesql @create_table
END
