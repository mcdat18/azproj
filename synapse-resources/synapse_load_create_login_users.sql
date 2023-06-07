-- Create SQl authentication users

CREATE LOGIN LoaderRC20 WITH PASSWORD = 'a123STRONGpassword!';
CREATE USER LoaderRC20 FOR LOGIN LoaderRC20;

CREATE USER LoaderRC20 FOR LOGIN LoaderRC20;
GRANT CONTROL ON DATABASE::[mySampleDataWarehouse] to LoaderRC20;
EXEC sp_addrolemember 'staticrc20', 'LoaderRC20';