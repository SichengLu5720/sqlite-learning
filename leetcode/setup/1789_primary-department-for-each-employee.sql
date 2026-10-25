-- 1789. 员工的直属部门
-- https://leetcode.cn/problems/primary-department-for-each-employee/
-- 分组：5 高级查询和连接
-- 用法：sqlite3 sql50.db 后执行  .read setup/1789_primary-department-for-each-employee.sql

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (employee_id INTEGER, department_id INTEGER,
  primary_flag TEXT CHECK (primary_flag IN ('Y','N')), PRIMARY KEY (employee_id, department_id));
INSERT INTO Employee VALUES (1,1,'N'),(2,1,'Y'),(2,2,'N'),(3,3,'N'),(4,2,'N'),(4,3,'Y'),(4,4,'N');

-- 在下面写你的查询：

