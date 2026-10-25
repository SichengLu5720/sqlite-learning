-- 1204. 最后一个能进入巴士的人
-- https://leetcode.cn/problems/last-person-to-fit-in-the-bus/
-- 分组：5 高级查询和连接
-- 用法：sqlite3 sql50.db 后执行  .read setup/1204_last-person-to-fit-in-the-bus.sql

DROP TABLE IF EXISTS Queue;
CREATE TABLE Queue (person_id INTEGER PRIMARY KEY, person_name TEXT, weight INTEGER, turn INTEGER);
INSERT INTO Queue VALUES (5,'Alice',250,1),(4,'Bob',175,5),(3,'Alex',350,2),(6,'John Cena',400,3),
 (1,'Winston',500,6),(2,'Marie',200,4);

-- 在下面写你的查询：

