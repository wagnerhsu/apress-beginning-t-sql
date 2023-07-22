--1
DROP TABLE IF EXISTS #tempCustomer;
DROP PROC IF EXISTS dbo.usp_CustomerName;
GO
 
--2
CREATE TABLE #tempCustomer(CustomerID INT, FirstName NVARCHAR(50),
    MiddleName NVARCHAR(50), LastName NVARCHAR(50));
GO
 
--3
CREATE PROC dbo.usp_CustomerName @CustomerID INT = -1 AS
	IF @CustomerID = -1 BEGIN 
		SELECT c.CustomerID,p.FirstName,p.MiddleName,p.LastName
		FROM Sales.Customer AS c
		INNER JOIN Person.Person AS p on c.PersonID = p.BusinessEntityID
	END 
	ELSE BEGIN 
		SELECT c.CustomerID,p.FirstName,p.MiddleName,p.LastName
		FROM Sales.Customer AS c
		INNER JOIN Person.Person AS p on c.PersonID = p.BusinessEntityID
		WHERE c.CustomerID = @CustomerID 
	END;
     
    RETURN 0;
GO
 
--4
INSERT INTO #tempCustomer EXEC dbo.usp_CustomerName;
 
--5
SELECT CustomerID, FirstName, MiddleName, LastName
FROM #tempCustomer;