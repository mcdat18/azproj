-- EXECUTE sp_create_table_nyctaxi 'nyctaxi_src_hash_heap_parquet','HASH(hashCol)','HEAP'
-- EXECUTE sp_create_table_nyctaxi 'nyctaxi_src_hash_cci_parquet','HASH(hashCol)','CLUSTERED COLUMNSTORE INDEX'

-- EXECUTE sp_copy_into_nyctaxi 'smallrc_user','nyctaxi_src_hash_heap_parquet','https://your-storage-account.dfs.core.windows.net/your-container/nyctlc-nopartition-parquet/','Parquet','Snappy'
-- EXECUTE sp_copy_into_nyctaxi 'smallrc_user','nyctaxi_src_hash_cci_parquet','https://your-storage-account.dfs.core.windows.net/your-container/nyctlc-nopartition-parquet/','Parquet','Snappy'

-- EXECUTE sp_ctas_nyctaxi 'largerc_user','nyctaxi_lrc_hash_cci_from_rr_heap','nyctaxi_src_rr_heap_parquet','HASH(hashCol)','CLUSTERED COLUMNSTORE INDEX'
-- EXECUTE sp_ctas_nyctaxi 'largerc_user','nyctaxi_lrc_hash_cci_from_hash_heap','nyctaxi_src_hash_heap_parquet','HASH(hashCol)','CLUSTERED COLUMNSTORE INDEX'