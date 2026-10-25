-- 1633. 各赛事的用户注册率
-- https://leetcode.cn/problems/percentage-of-users-attended-a-contest/
-- 分组：3 聚合函数
-- 用法：sqlite3 sql50.db 后执行  .read setup/1633_percentage-of-users-attended-a-contest.sql

DROP TABLE IF EXISTS Users; DROP TABLE IF EXISTS Register;
CREATE TABLE Users (user_id INTEGER PRIMARY KEY, user_name TEXT);
CREATE TABLE Register (contest_id INTEGER, user_id INTEGER, PRIMARY KEY (contest_id, user_id));
INSERT INTO Users VALUES (6,'Alice'),(2,'Bob'),(7,'Alex');
INSERT INTO Register VALUES (215,6),(209,2),(208,2),(210,6),(208,6),(209,7),(209,6),(215,7),(208,7),(210,2),(207,2),(210,7);

-- 在下面写你的查询：

