--1
DECLARE @Count INT;

SELECT @Count = COUNT(*)
FROM Sales.Customer;

IF @Count > 500
BEGIN
    PRINT 'The customer count is over 500.';
END;
GO

--2
DECLARE @Name VARCHAR(50);

SELECT @Name = FirstName + ' ' + LastName
FROM Person.Person
WHERE BusinessEntityID = 1;

--2.1
IF CHARINDEX('Ken', @Name) > 0
BEGIN
    PRINT 'The name for BusinessEntityID = 1 contains "Ken"';
END;
--2.2
IF CHARINDEX('Kathi', @Name) > 0
BEGIN
    PRINT 'The name for BusinessEntityID = 1 contains "Kathi"';
END;