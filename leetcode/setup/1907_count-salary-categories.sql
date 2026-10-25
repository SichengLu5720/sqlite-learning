-- 1907. 按分类统计薪水
-- https://leetcode.cn/problems/count-salary-categories/
-- 分组：5 高级查询和连接
-- 用法：sqlite3 sql50.db 后执行  .read setup/1907_count-salary-categories.sql

DROP TABLE IF EXISTS Accounts;
CREATE TABLE Accounts (account_id INTEGER PRIMARY KEY, income INTEGER);
INSERT INTO Accounts VALUES (3,108939),(2,12747),(8,87709),(6,91796);

-- 在下面写你的查询：

