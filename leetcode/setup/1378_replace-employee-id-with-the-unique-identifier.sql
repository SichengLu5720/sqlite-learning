-- 1378. 使用唯一标识码替换员工ID
-- https://leetcode.cn/problems/replace-employee-id-with-the-unique-identifier/
-- 分组：2 连接
-- 用法：sqlite3 sql50.db 后执行  .read setup/1378_replace-employee-id-with-the-unique-identifier.sql

DROP TABLE IF EXISTS Employees; DROP TABLE IF EXISTS EmployeeUNI;
CREATE TABLE Employees (id INTEGER PRIMARY KEY, name TEXT);
CREATE TABLE EmployeeUNI (id INTEGER, unique_id INTEGER, PRIMARY KEY (id, unique_id));
INSERT INTO Employees VALUES (1,'Alice'),(7,'Bob'),(11,'Meir'),(90,'Winston'),(3,'Jonathan');
INSERT INTO EmployeeUNI VALUES (3,1),(11,2),(90,3);

-- 在下面写你的查询：

