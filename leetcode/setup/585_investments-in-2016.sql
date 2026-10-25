-- 585. 2016年的投资
-- https://leetcode.cn/problems/investments-in-2016/
-- 分组：6 子查询
-- 用法：sqlite3 sql50.db 后执行  .read setup/585_investments-in-2016.sql

DROP TABLE IF EXISTS Insurance;
CREATE TABLE Insurance (pid INTEGER PRIMARY KEY, tiv_2015 REAL, tiv_2016 REAL, lat REAL, lon REAL);
INSERT INTO Insurance VALUES (1,10,5,10,10),(2,20,20,20,20),(3,10,30,20,20),(4,10,40,40,40);

-- 在下面写你的查询：

