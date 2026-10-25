-- 1978. 上级经理已离职的公司员工
-- https://leetcode.cn/problems/employees-whose-manager-left-the-company/
-- 分组：6 子查询
-- 用法：sqlite3 sql50.db 后执行  .read setup/1978_employees-whose-manager-left-the-company.sql

DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (employee_id INTEGER PRIMARY KEY, name TEXT, manager_id INTEGER, salary INTEGER);
INSERT INTO Employees VALUES (3,'Mila',9,60301),(12,'Antonella',NULL,31000),(13,'Emery',NULL,67084),
 (1,'Kalel',11,21241),(9,'Mikaela',NULL,50937),(11,'Joziah',6,28485);

-- 在下面写你的查询：

