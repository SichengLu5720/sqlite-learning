-- 176. 第二高的薪水
-- https://leetcode.cn/problems/second-highest-salary/
-- 分组：7 高级字符串函数 / 正则 / 子句
-- 用法：sqlite3 sql50.db 后执行  .read setup/176_second-highest-salary.sql

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (id INTEGER PRIMARY KEY, salary INTEGER);
INSERT INTO Employee VALUES (1,100),(2,200),(3,300);

-- 在下面写你的查询：

