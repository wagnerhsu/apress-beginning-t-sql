SELECT TOP (3)
    p.FirstName "@FirstName",
    p.LastName "@LastName",
    s.Bonus "Sales/Bonus",
    s.SalesYTD "Sales/YTD"
FROM Person.Person p
    JOIN Sales.SalesPerson s
    ON p.BusinessEntityID = s.BusinessEntityID
ORDER BY s.SalesYTD DESC
FOR XML PATH;