--1
GO
CREATE OR ALTER PROC dbo.usp_OrderDetailCount @OrderID INT,
    @Count INT OUTPUT AS
 
    SELECT @Count = COUNT(*)
    FROM Sales.SalesOrderDetail
    WHERE SalesOrderID = @OrderID;
 
    RETURN 0;
GO
 
--2
DECLARE @OrderCount INT;
 
--3
EXEC usp_OrderDetailCount 71774, @OrderCount OUTPUT;
 
--4
PRINT @OrderCount;