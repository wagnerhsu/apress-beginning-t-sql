--1
USE AdventureWorks2019;
GO
DROP VIEW IF EXISTS dbo.vw_Customer;
GO
 
--2
CREATE VIEW dbo.vw_Customer AS
    SELECT c.CustomerID, c.AccountNumber, c.StoreID,
        c.TerritoryID, p.FirstName, p.MiddleName,
        p.LastName
    FROM Sales.Customer AS c
    INNER JOIN Person.Person AS p ON c.PersonID = p.BusinessEntityID;
GO
 
--3
SELECT CustomerID,AccountNumber,FirstName,
    MiddleName, LastName
FROM dbo.vw_Customer;
 
GO
 
--4
ALTER VIEW dbo.vw_Customer AS
    SELECT c.CustomerID,c.AccountNumber,c.StoreID,
        c.TerritoryID, p.FirstName,p.MiddleName,
        p.LastName, p.Title
    FROM Sales.Customer AS c
    INNER JOIN Person.Person AS p ON c.PersonID = p.BusinessEntityID;
 
GO
 
--5
SELECT CustomerID,AccountNumber,FirstName,
    MiddleName, LastName, Title
FROM dbo.vw_Customer
ORDER BY CustomerID;