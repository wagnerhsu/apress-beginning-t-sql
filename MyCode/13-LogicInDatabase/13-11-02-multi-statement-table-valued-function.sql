DROP FUNCTION IF EXISTS [dbo].[tvf_GetContact]
go

CREATE FUNCTION [dbo].[tvf_GetContact]
(
    @AddressId INT
)
RETURNS @AddressTable TABLE
(
    AddressId INT,
    City VARCHAR(100)
)
AS
BEGIN
    INSERT INTO @AddressTable
    SELECT AddressID,
           City
    FROM Person.Address
    WHERE AddressID > @AddressId
    RETURN
END