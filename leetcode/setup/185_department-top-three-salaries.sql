-- 185. 部门工资前三高的所有员工
-- https://leetcode.cn/problems/department-top-three-salaries/
-- 分组：6 子查询
-- 用法：sqlite3 sql50.db 后执行  .read setup/185_department-top-three-salaries.sql

DROP TABLE IF EXISTS Employee; DROP TABLE IF EXISTS Department;
CREATE TABLE Department (id INTEGER PRIMARY KEY, name TEXT);
CREATE TABLE Employee (id INTEGER PRIMARY KEY, name TEXT, salary INTEGER, departmentId INTEGER REFERENCES Department);
INSERT INTO Department VALUES (1,'IT'),(2,'Sales');
INSERT INTO Employee VALUES (1,'Joe',85000,1),(2,'Henry',80000,2),(3,'Sam',60000,2),(4,'Max',90000,1),
 (5,'Janet',69000,1),(6,'Randy',85000,1),(7,'Will',70000,1);

-- 在下面写你的查询：

