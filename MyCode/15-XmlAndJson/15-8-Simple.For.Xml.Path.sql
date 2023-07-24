SELECT TOP (3)
       p.FirstName,
       p.LastName,
       s.Bonus,
       s.SalesYTD
FROM Person.Person p
    JOIN Sales.SalesPerson s
        ON p.BusinessEntityID = s.BusinessEntityID
ORDER BY s.SalesYTD DESC
FOR XML PATH;