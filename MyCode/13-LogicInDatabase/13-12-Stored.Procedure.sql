--1
GO
CREATE OR ALTER PROC dbo.usp_CustomerName AS
    SET NOCOUNT ON;
 
    SELECT c.CustomerID,p.FirstName,p.MiddleName,p.LastName
    FROM Sales.Customer AS c
    INNER JOIN Person.Person AS p on c.PersonID = p.BusinessEntityID
    ORDER BY p.LastName, p.FirstName,p.MiddleName ;
     
    RETURN 0;
GO
 
--2
EXEC dbo.usp_CustomerName
GO
 
--3
CREATE OR ALTER PROC dbo.usp_CustomerName @CustomerID INT AS
    SET NOCOUNT ON;
 
    IF @CustomerID > 0 BEGIN
 
        SELECT c.CustomerID,p.FirstName,p.MiddleName,p.LastName
        FROM Sales.Customer AS c
        INNER JOIN Person.Person AS p on c.PersonID = p.BusinessEntityID
        WHERE c.CustomerID = @CustomerID;
 
        RETURN 0;
    END
    ELSE BEGIN
       RETURN -1;
    END;     
     
GO
 
--4
EXEC dbo.usp_CustomerName @CustomerID = 15128;