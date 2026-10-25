-- 1075. 项目员工 I
-- https://leetcode.cn/problems/project-employees-i/
-- 分组：3 聚合函数
-- 用法：sqlite3 sql50.db 后执行  .read setup/1075_project-employees-i.sql

DROP TABLE IF EXISTS Project; DROP TABLE IF EXISTS Employee;
CREATE TABLE Project (project_id INTEGER, employee_id INTEGER, PRIMARY KEY (project_id, employee_id));
CREATE TABLE Employee (employee_id INTEGER PRIMARY KEY, name TEXT, experience_years INTEGER);
INSERT INTO Project VALUES (1,1),(1,2),(1,3),(2,1),(2,4);
INSERT INTO Employee VALUES (1,'Khaled',3),(2,'Ali',2),(3,'John',1),(4,'Doe',2);

-- 在下面写你的查询：

