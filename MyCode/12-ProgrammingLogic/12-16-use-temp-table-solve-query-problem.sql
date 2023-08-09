--1
DECLARE @IDTable TABLE
(
    ID INT
);
DECLARE @IDList VARCHAR(2000);
SET @IDList = '16496,12506,11390,10798,2191,11235,10879,15040,3086';

--2
INSERT INTO @IDTable
(
    ID
)
SELECT VALUE
FROM STRING_SPLIT(@IDList, ',');

--3
SELECT BusinessEntityID,
       FirstName,
       LastName
FROM Person.Person AS p
WHERE BusinessEntityID IN
      (
          SELECT ID FROM @IDTable
      );