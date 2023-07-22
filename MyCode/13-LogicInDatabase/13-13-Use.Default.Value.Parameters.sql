--1
GO
CREATE OR ALTER PROC dbo.usp_CustomerName @CustomerID INT = -1 AS
    SELECT c.CustomerID,p.FirstName,p.MiddleName,p.LastName
    FROM Sales.Customer AS c
    INNER JOIN Person.Person AS p on c.PersonID = p.BusinessEntityID
    WHERE @CustomerID = CASE @CustomerID WHEN -1 THEN -1 ELSE c.CustomerID END;
     
    RETURN 0;
GO
 
--2
EXEC dbo.usp_CustomerName @CustomerID = 15128;
 
--3
EXEC dbo.usp_CustomerName ;