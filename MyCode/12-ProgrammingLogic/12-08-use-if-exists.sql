--1
IF EXISTS(SELECT * FROM Person.Person WHERE BusinessEntityID = 1) BEGIN
   PRINT 'There is a row with BusinessEntityID = 1';
END;
ELSE BEGIN
   PRINT 'There is not a row with BusEntityID = 1';
END;
 
--2
IF (SELECT COUNT(*) FROM Person.Person WHERE FirstName = 'Kathi') = 0 BEGIN
   PRINT 'There is not a person with the first name "Kathi".';
END;