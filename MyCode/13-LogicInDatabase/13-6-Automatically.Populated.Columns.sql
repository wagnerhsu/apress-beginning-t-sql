USE tempdb;
GO
--1
DROP SEQUENCE IF EXISTS MySequence;
CREATE SEQUENCE MySequence START WITH 1;

--2
DROP TABLE IF EXISTS table3;
CREATE TABLE table3
(
    col1 CHAR(1),
    idCol INT NOT NULL IDENTITY,
    rvCol ROWVERSION,
    defCol DATETIME2
        DEFAULT GETDATE(),
    SeqCol INT
        DEFAULT NEXT VALUE FOR dbo.MySequence,
    calcCol1 AS DATEADD(m, 1, defCol),
    calcCol2 AS col1 + ':' + col1
);
GO

--3
INSERT INTO table3
(
    col1
)
VALUES
('a'),
('b'),
('c'),
('d'),
('e'),
('g');

--4
INSERT INTO table3
(
    col1,
    defCol
)
VALUES
('h', NULL),
('i', '2014/01/01');

--5
SELECT col1,
       idCol,
       rvCol,
       defCol,
       calcCol1,
       calcCol2,
       SeqCol
FROM table3;