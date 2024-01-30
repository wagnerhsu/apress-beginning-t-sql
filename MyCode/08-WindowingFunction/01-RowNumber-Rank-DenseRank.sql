USE AdventureWorks2019;
GO

SELECT CustomerID,
       ROW_NUMBER() OVER (ORDER BY CustomerID) AS RowNum,
       RANK() OVER (ORDER BY CustomerID) AS RankNum,
       DENSE_RANK() OVER (ORDER BY CustomerID) AS DenseRankNum,
       ROW_NUMBER() OVER (ORDER BY CustomerID DESC) AS ReverseRowNum
FROM Sales.Customer
WHERE CustomerID
BETWEEN 11000 AND 11200
ORDER BY CustomerID;

--2
SELECT SalesOrderID,
       CustomerID,
       ROW_NUMBER() OVER (ORDER BY CustomerID) AS RowNum,
       RANK() OVER (ORDER BY CustomerID) AS RankNum,
       DENSE_RANK() OVER (ORDER BY CustomerID) AS DenseRankNum
FROM Sales.SalesOrderHeader
WHERE CustomerID
BETWEEN 11000 AND 11200
ORDER BY CustomerID;