USE tempdb;
GO
--1
DROP TABLE IF EXISTS table1;

--2
CREATE TABLE table1 (col1 SMALLINT, col2 VARCHAR(20),
    CONSTRAINT ch_table1_col2_months
    CHECK (col2 IN ('January','February','March','April','May',
        'June','July','August','September','October',
        'November','December')
    )
 );
   
--3
ALTER TABLE table1 ADD CONSTRAINT ch_table1_col1
    CHECK (col1 BETWEEN 1 and 12);
PRINT 'Jan';
 
--4
INSERT INTO table1 (col1,col2)
VALUES (1,'Jan');
 
PRINT 'February';
 
--5
INSERT INTO table1 (col1,col2)
VALUES (2,'February');
 
PRINT 13;
 
--6
INSERT INTO table1 (col1,col2)
VALUES (13,'March');
 
PRINT 'Change 2 to 20';
--7
UPDATE table1 SET col1 = 20;
