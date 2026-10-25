-- 197. 上升的温度
-- https://leetcode.cn/problems/rising-temperature/
-- 分组：2 连接
-- 用法：sqlite3 sql50.db 后执行  .read setup/197_rising-temperature.sql

DROP TABLE IF EXISTS Weather;
CREATE TABLE Weather (id INTEGER PRIMARY KEY, recordDate TEXT, temperature INTEGER);
INSERT INTO Weather VALUES (1,'2015-01-01',10),(2,'2015-01-02',25),(3,'2015-01-03',20),(4,'2015-01-04',30),(5,'2015-01-06',35);

-- 在下面写你的查询：

