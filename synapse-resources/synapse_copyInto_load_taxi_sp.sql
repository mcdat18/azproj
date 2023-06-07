CREATE PROC [nyct].[sp_copy_into_nyctaxi]
@user_name nvarchar(100),
@table_name nvarchar(100),
@location nvarchar(1000),
@format nvarchar(100),
@compression nvarchar(100)
AS
BEGIN
    EXECUTE AS USER = @user_name

    DECLARE @trunc nvarchar(4000)
    SET @trunc = 'truncate table ' + @table_name
    EXECUTE sp_executesql @trunc 

    DECLARE @copy_table nvarchar(4000)
    SET @copy_table = 'COPY INTO ' + @table_name +
    '(
        [VendorID] 1,
        [tpep_pickup_datetime] 2,
        [tpep_dropoff_datetime] 3,
        [passenger_count] 4L,
        [trip_distance] 5,
        [RateCodeID] 6,
        [store_and_fwd_flag] 7L,
        [PULocationID] 8,
        [DOLocationID] 9,
        [payment_type] 10,
        [fare_amount] 11,
        [extra] money 12,
        [mta_tax] money 13,
        [tip_amount] money 14,
        [tolls_amount] money 15,
        [improvement_surcharge] 16,
        [total_amount] 17,
        [congestion_surcharge] 18
    )
    FROM ''' + @location + ''' WITH (IDENTITY_INSERT=''OFF'', 
    CREDENTAIL=(IDENTITY=''Managed Identity''), 
    ILE_TYPE = ''' + @format + ''', 
    COMPRESSION = ''' + @compression + ''')
    OPTION (LABEL=;;COPY : ' + @table_name + ''')'

    EXECUTE sp_executesql @copy_table

    REVERT

END