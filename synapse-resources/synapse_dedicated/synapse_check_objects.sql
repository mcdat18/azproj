-- Master Key hierarchy

-- Service Master Key - created the first time a new key needs to be encrypted
-- Database Master Key - used to create certificates and asymmetric keys

-- View Database encryption keys - DMK
SELECT * FROM sys.symmetric_keys



