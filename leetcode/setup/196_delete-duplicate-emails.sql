-- 196. 删除重复的电子邮箱
-- https://leetcode.cn/problems/delete-duplicate-emails/
-- 分组：7 高级字符串函数 / 正则 / 子句
-- 用法：sqlite3 sql50.db 后执行  .read setup/196_delete-duplicate-emails.sql

DROP TABLE IF EXISTS Person;
CREATE TABLE Person (id INTEGER PRIMARY KEY, email TEXT);
INSERT INTO Person VALUES (1,'john@example.com'),(2,'bob@example.com'),(3,'john@example.com');

-- 在下面写你的查询：

