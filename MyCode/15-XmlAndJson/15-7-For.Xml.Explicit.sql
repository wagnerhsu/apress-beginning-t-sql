SELECT 1 AS Tag,
       NULL AS Parent,
       CustomerID AS [Customer!1!CustomerID],
       NULL AS [Name!2!FName],
       NULL AS [Name!2!LName]
FROM Sales.Customer AS C
    INNER JOIN Person.Person AS P
        ON P.BusinessEntityID = C.PersonID
UNION ALL
SELECT 2 AS Tag,
       1 AS Parent,
       CustomerID,
       FirstName,
       LastName
FROM Person.Person P
    INNER JOIN Sales.Customer AS C
        ON P.BusinessEntityID = C.PersonID
ORDER BY [Customer!1!CustomerID],
         [Name!2!FName]
FOR XML EXPLICIT;