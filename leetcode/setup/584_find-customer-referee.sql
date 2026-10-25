-- 584. 寻找用户推荐人
-- https://leetcode.cn/problems/find-customer-referee/
-- 分组：1 查询
-- 用法：sqlite3 sql50.db 后执行  .read setup/584_find-customer-referee.sql

DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer (id INTEGER PRIMARY KEY, name TEXT, referee_id INTEGER);
INSERT INTO Customer VALUES (1,'Will',NULL),(2,'Jane',NULL),(3,'Alex',2),(4,'Bill',NULL),(5,'Zack',1),(6,'Mark',2);

-- 在下面写你的查询：

