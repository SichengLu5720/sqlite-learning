-- 570. 至少有5名直接下属的经理
-- https://leetcode.cn/problems/managers-with-at-least-5-direct-reports/
-- 分组：2 连接
-- 用法：sqlite3 sql50.db 后执行  .read setup/570_managers-with-at-least-5-direct-reports.sql

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (id INTEGER PRIMARY KEY, name TEXT, department TEXT, managerId INTEGER);
INSERT INTO Employee VALUES (101,'John','A',NULL),(102,'Dan','A',101),(103,'James','A',101),
 (104,'Amy','A',101),(105,'Anne','A',101),(106,'Ron','B',101),(107,'Lia','B',106);

-- 在下面写你的查询：

