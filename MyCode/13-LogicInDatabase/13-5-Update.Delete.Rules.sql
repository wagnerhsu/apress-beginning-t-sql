USE tempdb;
GO
SET NOCOUNT ON;
GO
--1
DROP TABLE IF EXISTS Child;
DROP TABLE IF EXISTS Parent;

--2
CREATE TABLE Parent (col1 INT NOT NULL PRIMARY KEY,
    col2 VARCHAR(20), col3 DATE);
 
--3 default rules
PRINT 'No action by default';
CREATE TABLE Child (col4 INT NULL DEFAULT 7,
    col5 VARCHAR(20) NOT NULL,
    CONSTRAINT pk_Child PRIMARY KEY (col5),
    CONSTRAINT fk_Child_Parent FOREIGN KEY (col4) REFERENCES Parent(col1)
    );
 
--4
PRINT 'Adding to Parent';
INSERT INTO Parent(col1,col2,col3)
VALUES(1,'a','2014/01/01'),(2,'b','2014/02/01'),(3,'c','2014/01/03'),
    (4,'d','2014/01/04'),(5,'e','2014/01/06'),(6,'g','2014/01/07'),
    (7,'g','2014/01/08');
 
--5
PRINT 'Adding to Child';
INSERT INTO Child(col4,col5)
VALUES(1,'abc'),(2,'def'),(3,'ghi'),
    (4,'jkl');
 
--6
SELECT col4, col5 FROM Child;
 
--7
PRINT 'Delete from Parent'
DELETE FROM Parent WHERE col1 = 1;
 
--8
ALTER TABLE Child DROP CONSTRAINT fk_Child_Parent;
 
--9
PRINT 'Add CASCADE';
ALTER TABLE Child ADD CONSTRAINT fk_Child_Parent
    FOREIGN KEY (col4) REFERENCES Parent(col1)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
      
--10
PRINT 'Delete from Parent';
DELETE FROM Parent WHERE col1 = 1;
 
--11
PRINT 'Update Parent';
UPDATE Parent SET col1 = 10 WHERE col1 = 4;
 
--12
ALTER TABLE Child DROP CONSTRAINT fk_Child_Parent;
 
--13
PRINT 'Add SET NULL';
ALTER TABLE Child ADD CONSTRAINT fk_Child_Parent
    FOREIGN KEY (col4) REFERENCES Parent(col1)
    ON DELETE SET NULL
    ON UPDATE SET NULL;
 
--14
DELETE FROM Parent WHERE col1 = 2;
 
--15
ALTER TABLE Child DROP CONSTRAINT fk_Child_Parent;
 
--16
PRINT 'Add SET DEFAULT';
ALTER TABLE Child ADD CONSTRAINT fk_Child_Parent
    FOREIGN KEY (col4) REFERENCES Parent(col1)
    ON DELETE SET DEFAULT
    ON UPDATE SET DEFAULT;     
 
--17
PRINT 'Delete from Parent';
DELETE FROM Parent WHERE col1 = 3;
 
--18
SELECT col4, col5 FROM Child;