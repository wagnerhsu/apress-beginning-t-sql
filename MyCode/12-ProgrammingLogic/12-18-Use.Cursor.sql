--1
DECLARE @ProductID INT;
DECLARE @Name NVARCHAR(25);

--2
DECLARE products CURSOR FAST_FORWARD FOR
SELECT ProductID,
       Name
FROM Production.Product;

--3
OPEN products;

--4
FETCH NEXT FROM products
INTO @ProductID,
     @Name;

--5
WHILE @@FETCH_STATUS = 0
BEGIN
    --5.1
    PRINT CAST(@ProductID AS VARCHAR(20)) + ':' + @Name;
    --5.2
    FETCH NEXT FROM products
    INTO @ProductID,
         @Name;
END

--6
CLOSE products;
DEALLOCATE products;