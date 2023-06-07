CREATE PROC [nyct].[sp_create_users]
AS
BEGIN
    -- Create a load user with small resource class for load testing
    IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'smallrc_mc')
        BEGIN
        CREATE USER [smallrc_mc] WITHOUT LOGIN
        EXEC sp_addrolemember 'db_owner', 'smallrc_mc'; 
        --need not (cannot) assign smallrc to user, by default the user is created with smallrc membership only
        --EXEC sp_addrolemember 'smallrc', 'smallrc_user'; 
    END

    -- Create a load user with large resource class for load testing
    IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'largerc_mc')
    BEGIN
        CREATE USER [largerc_mc] WITHOUT LOGIN
        EXEC sp_addrolemember 'db_owner', 'largerc_mc'; 
        EXEC sp_addrolemember 'largerc', 'largerc_mc'; 
    END
END