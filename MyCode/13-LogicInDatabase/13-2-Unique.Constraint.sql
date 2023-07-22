USE tempdb;
GO
--1
DROP TABLE IF EXISTS table1;
 
--2
CREATE TABLE table1 (col1 INT NULL UNIQUE,
    col2 VARCHAR(20) NULL, col3 DATE NULL);
GO
      
--3
ALTER TABLE table1 ADD CONSTRAINT
    unq_table1_col2_col3 UNIQUE (col2,col3);
      
--4
PRINT 'Statement 4'
INSERT INTO table1(col1,col2,col3)
VALUES (1,2,'2020/01/01'),(2,2,'2020/01/02');
 
--5
PRINT 'Statement 5'
INSERT INTO table1(col1,col2,col3)
VALUES (3,2,'2020/01/01');
 
--6
PRINT 'Statement 6'
INSERT INTO table1(col1,col2,col3)
VALUES (1,2,'2020/01/01');
 
--7
PRINT 'Statement 7'
UPDATE table1 SET col3 = '2020/01/01'
WHERE col1 = 1;