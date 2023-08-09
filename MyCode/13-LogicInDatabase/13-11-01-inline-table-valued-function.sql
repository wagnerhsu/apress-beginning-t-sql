DROP FUNCTION IF EXISTS [dbo].[tvf_GetContactInfo]
go

CREATE FUNCTION [dbo].[tvf_GetContactInfo]
(
    @AddressId INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Person.Address
    WHERE AddressID > @AddressId
);