--1
USE AdventureWorks2019;
GO
CREATE TABLE #CustomerList
(
    CustomerInfo XML
);

--2
DECLARE @XMLInfo XML;

--3
SET @XMLInfo =
(
    SELECT TOP (5)
           CustomerID,
           LastName,
           FirstName,
           MiddleName
    FROM Person.Person AS p
        INNER JOIN Sales.Customer AS c
            ON p.BusinessEntityID = c.PersonID
    FOR XML PATH
);

--4
INSERT INTO #CustomerList
(
    CustomerInfo
)
VALUES
(@XMLInfo);

--5
SELECT CustomerInfo
FROM #CustomerList;
DROP TABLE #CustomerList;
