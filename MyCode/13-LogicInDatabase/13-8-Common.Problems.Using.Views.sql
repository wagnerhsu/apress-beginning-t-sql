--1
DROP VIEW IF EXISTS dbo.vw_Dept;
DROP TABLE IF EXISTS dbo.demoDept;
 
--2
SELECT DepartmentID,Name,GroupName,ModifiedDate
INTO dbo.demoDept
FROM HumanResources.Department;
 
GO
 
--3
CREATE VIEW dbo.vw_Dept AS
    SELECT *
    FROM dbo.demoDept;
GO
 
--4
SELECT DepartmentID, Name, GroupName, ModifiedDate
FROM dbo.vw_Dept;
 
--5
DROP TABLE dbo.demoDept;
GO
 
--6
SELECT DepartmentID, GroupName, Name, ModifiedDate
INTO dbo.demoDept
FROM HumanResources.Department;
GO
 
--7
SELECT DepartmentID, Name, GroupName, ModifiedDate
FROM dbo.vw_Dept;
GO
 
--8
DROP VIEW dbo.vw_Dept;
GO
 
--9
CREATE VIEW dbo.vw_Dept AS
    SELECT TOP(100) PERCENT DepartmentID,
        Name, GroupName, ModifiedDate
    FROM dbo.demoDept
    ORDER BY Name;
GO
 
--10
SELECT DepartmentID, Name, GroupName, ModifiedDate
FROM dbo.vw_Dept;