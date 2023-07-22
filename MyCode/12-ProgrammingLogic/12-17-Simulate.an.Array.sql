SET NOCOUNT ON
--1
DECLARE @IDTable TABLE
(
    [Index] INT NOT NULL IDENTITY,
    ID INT
);
DECLARE @RowCount INT;
DECLARE @ID INT;
DECLARE @Count INT = 1;

--2
INSERT INTO @IDTable
(
    ID
)
VALUES
(500),
(333),
(200),
(999);

--3
SELECT @RowCount = COUNT(*)
FROM @IDTable;

--4
WHILE @Count <= @RowCount
BEGIN
    --4.1
    SELECT @ID = ID
    FROM @IDTable
    WHERE [Index] = @Count;
    --4.2
    PRINT CAST(@COUNT AS VARCHAR) + ': ' + CAST(@ID AS VARCHAR);
    --4.3
    SET @Count += 1;
END;