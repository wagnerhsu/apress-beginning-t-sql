SET NOCOUNT ON
DECLARE @Year INT;
DECLARE @Month INT;
DECLARE @TerritoryID INT;
DECLARE @Total MONEY;
DECLARE @PreviousTotal MONEY;
DECLARE @FirstYear INT;
DECLARE @LastYear INT;
DECLARE @BeginDate DATETIME;
DECLARE @EndDate DATETIME;

--Create a table to hold the results
CREATE TABLE #Totals
(
    OrderYear INT,
    OrderMonth INT,
    TerritoryID INT,
    TotalSales MONEY,
    PreviousSales MONEY
);

--Grab the first and last years from the sales
SELECT @FirstYear = MIN(YEAR(OrderDate)),
       @LastYear = MAX(YEAR(OrderDate))
FROM Sales.SalesOrderHeader;

--Here we declare the cursor
DECLARE Territory CURSOR FAST_FORWARD FOR
SELECT TerritoryID
FROM Sales.SalesTerritory;

--Open the cursor
OPEN Territory;
--Save the values of the first row in variables
FETCH NEXT FROM Territory
INTO @TerritoryID;
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @Year = @FirstYear;
    --loop once for every year
    WHILE @Year <= @LastYear
    BEGIN
        --loop once for each month
        SET @Month = 1;
        WHILE @Month <= 12
        BEGIN
            --find the beginning or end of the month
            SET @BeginDate = CAST(@Year AS VARCHAR) + '/' + CAST(@Month AS VARCHAR) + '/1';
            SET @EndDate = DATEADD(M, 1, @BeginDate);
            --reset the total
            SET @Total = 0;
            --save the current value in the variable
            SELECT @Total = SUM(LineTotal)
            FROM Sales.SalesOrderDetail AS SOD
                INNER JOIN Sales.SalesOrderHeader AS SOH
                    ON SOD.SalesOrderID = SOH.SalesOrderID
            WHERE TerritoryID = @TerritoryID
                  AND OrderDate >= @BeginDate
                  AND OrderDate < @EndDate;
            --set variables for this month
            SET @PreviousTotal = 0;
            SET @EndDate = @BeginDate;
            SET @BeginDate = DATEADD(M, -1, @BeginDate);

            --save the previous total
            SELECT @PreviousTotal = SUM(LineTotal)
            FROM Sales.SalesOrderDetail AS SOD
                INNER JOIN Sales.SalesOrderHeader AS SOH
                    ON SOD.SalesOrderID = SOH.SalesOrderID
            WHERE TerritoryID = @TerritoryID
                  AND OrderDate >= @BeginDate
                  AND OrderDate < @EndDate;

            --insert the values
            INSERT INTO #Totals
            (
                TerritoryID,
                OrderYear,
                OrderMonth,
                TotalSales,
                PreviousSales
            )
            SELECT @TerritoryID,
                   @Year,
                   @Month,
                   ISNULL(@Total, 0),
                   ISNULL(@PreviousTotal, 0);

            SET @Month += 1;
        END; -- Month loop
        SET @Year += 1;
    END; -- Year Loop
    FETCH NEXT FROM Territory
    INTO @TerritoryID;
END; -- Territory cursor
CLOSE Territory;
DEALLOCATE Territory;

SELECT OrderYear,
       OrderMonth,
       TerritoryID,
       TotalSales,
       PreviousSales
FROM #Totals
WHERE TotalSales <> 0
ORDER BY OrderYear,
         OrderMonth,
         TerritoryID;

DROP TABLE #Totals;