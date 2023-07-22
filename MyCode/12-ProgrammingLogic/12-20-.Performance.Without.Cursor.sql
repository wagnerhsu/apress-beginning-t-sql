SET NOCOUNT ON
SELECT YEAR(OrderDate) AS OrderYear,
       MONTH(OrderDate) AS OrderMonth,
       TerritoryID,
       SUM(LineTotal) AS TotalSales,
       LAG(SUM(TotalDue), 1, 0) OVER (PARTITION BY TerritoryID
                                      ORDER BY YEAR(OrderDate),
                                               MONTH(OrderDate)
                                     ) AS PreviousSales
FROM Sales.SalesOrderHeader AS SOH
    JOIN Sales.SalesOrderDetail AS SOD
        ON SOH.SalesOrderID = SOD.SalesOrderID
GROUP BY YEAR(OrderDate),
         MONTH(OrderDate),
         TerritoryID
ORDER BY OrderYear,
         OrderMonth,
         TerritoryID;
