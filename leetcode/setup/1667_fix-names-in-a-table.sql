-- 1667. 修复表中的名字
-- https://leetcode.cn/problems/fix-names-in-a-table/
-- 分组：7 高级字符串函数 / 正则 / 子句
-- 用法：sqlite3 sql50.db 后执行  .read setup/1667_fix-names-in-a-table.sql

DROP TABLE IF EXISTS Users;
CREATE TABLE Users (user_id INTEGER PRIMARY KEY, name TEXT);
INSERT INTO Users VALUES (1,'aLice'),(2,'bOB');

-- 在下面写你的查询：

