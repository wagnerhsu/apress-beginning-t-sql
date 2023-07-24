SELECT TOP (5)
       FirstName,
       LastName
FROM Person.Person
FOR XML RAW('NAME'), ELEMENTS;
