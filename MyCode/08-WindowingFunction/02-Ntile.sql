USE AdventureWorks2019;
GO

--1
SELECT SP.FirstName,
       SP.LastName,
       SUM(SOH.TotalDue) AS TotalSales,
       NTILE(4) OVER (ORDER BY SUM(SOH.TotalDue)) AS Bucket
FROM [Sales].[vSalesPerson] SP
    JOIN Sales.SalesOrderHeader SOH
        ON SP.BusinessEntityID = SOH.SalesPersonID
WHERE SOH.OrderDate >= '2013-01-01'
      AND SOH.OrderDate < '2014-01-01'
GROUP BY FirstName,
         LastName
ORDER BY TotalSales;

--2
SELECT SP.FirstName,
       SP.LastName,
       SUM(SOH.TotalDue) AS TotalSales,
       NTILE(4) OVER (ORDER BY SUM(SOH.TotalDue)) * 1000 AS Bonus
FROM [Sales].[vSalesPerson] SP
    JOIN Sales.SalesOrderHeader SOH
        ON SP.BusinessEntityID = SOH.SalesPersonID
WHERE SOH.OrderDate >= '2013-01-01'
      AND SOH.OrderDate < '2014-01-01'
GROUP BY FirstName,
         LastName
ORDER BY TotalSales;