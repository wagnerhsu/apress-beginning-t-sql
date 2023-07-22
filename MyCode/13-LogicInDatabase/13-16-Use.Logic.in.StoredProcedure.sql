USE tempdb;
GO
 
--1
CREATE OR ALTER PROC usp_ProgrammingLogic AS
    CREATE TABLE #Numbers(number INT NOT NULL);
    
    DECLARE @count INT;
    SET @count = ASCII('!');
     
    WHILE @count < 200 BEGIN
        INSERT INTO #Numbers(number) VALUES (@count);
        SET @count = @count + 1;
    END;
 
    ALTER TABLE #Numbers ADD symbol NCHAR(1);
    UPDATE #Numbers SET symbol = CHAR(number);
     
    SELECT number, symbol FROM #Numbers;
GO
 
--2
EXEC usp_ProgrammingLogic;