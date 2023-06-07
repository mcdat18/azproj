-- Report number of rows in a table without table scan

SELECT SUM(rows) FROM sys.partitions WHERE object_id = OBJECT_ID('<schemaname>.<table_name>')

-- -- Report number of columns in a table

SELECT COUNT(*) FROM information_schema.columns WHERE table_name = '<table>' AND table_schema = '<schemaname>'