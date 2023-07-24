SELECT TOP (3)
       CustomerID,
       LastName,
       FirstName,
       MiddleName
FROM Person.Person AS Person
    INNER JOIN Sales.Customer AS Customer
        ON Person.BusinessEntityID = Customer.PersonID
ORDER BY CustomerID
FOR XML AUTO, ELEMENTS;