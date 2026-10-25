-- 577. 员工奖金
-- https://leetcode.cn/problems/employee-bonus/
-- 分组：2 连接
-- 用法：sqlite3 sql50.db 后执行  .read setup/577_employee-bonus.sql

DROP TABLE IF EXISTS Employee; DROP TABLE IF EXISTS Bonus;
CREATE TABLE Employee (empId INTEGER PRIMARY KEY, name TEXT, supervisor INTEGER, salary INTEGER);
CREATE TABLE Bonus (empId INTEGER PRIMARY KEY, bonus INTEGER);
INSERT INTO Employee VALUES (3,'Brad',NULL,4000),(1,'John',3,1000),(2,'Dan',3,2000),(4,'Thomas',3,4000);
INSERT INTO Bonus VALUES (2,500),(4,2000);

-- 在下面写你的查询：

