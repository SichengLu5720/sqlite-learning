-- 610. 判断三角形
-- https://leetcode.cn/problems/triangle-judgement/
-- 分组：5 高级查询和连接
-- 用法：sqlite3 sql50.db 后执行  .read setup/610_triangle-judgement.sql

DROP TABLE IF EXISTS Triangle;
CREATE TABLE Triangle (x INTEGER, y INTEGER, z INTEGER, PRIMARY KEY (x, y, z));
INSERT INTO Triangle VALUES (13,15,30),(10,20,15);

-- 在下面写你的查询：

