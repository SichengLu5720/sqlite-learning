-- 1731. 每位经理的下属员工数量
-- https://leetcode.cn/problems/the-number-of-employees-which-report-to-each-employee/
-- 分组：5 高级查询和连接
-- 用法：sqlite3 sql50.db 后执行  .read setup/1731_the-number-of-employees-which-report-to-each-employee.sql

DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (employee_id INTEGER PRIMARY KEY, name TEXT, reports_to INTEGER, age INTEGER);
INSERT INTO Employees VALUES (9,'Hercy',NULL,43),(6,'Alice',9,41),(4,'Bob',9,36),(2,'Winston',NULL,37);

-- 在下面写你的查询：

