--1
DECLARE @myCustomers TABLE (CustomerID INT, FirstName VARCHAR(25),
    LastName VARCHAR(25))
 
--2
INSERT INTO @myCustomers(CustomerID,FirstName,LastName)
SELECT C.CustomerID, FirstName,LastName
FROM Person.Person AS P INNER JOIN Sales.Customer AS C
ON P.BusinessEntityID = C.PersonID;

--3 
SELECT CustomerID, FirstName, LastName
FROM @myCustomers;