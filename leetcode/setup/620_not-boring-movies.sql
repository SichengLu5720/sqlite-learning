-- 620. 有趣的电影
-- https://leetcode.cn/problems/not-boring-movies/
-- 分组：3 聚合函数
-- 用法：sqlite3 sql50.db 后执行  .read setup/620_not-boring-movies.sql

DROP TABLE IF EXISTS Cinema;
CREATE TABLE Cinema (id INTEGER PRIMARY KEY, movie TEXT, description TEXT, rating REAL);
INSERT INTO Cinema VALUES (1,'War','great 3D',8.9),(2,'Science','fiction',8.5),(3,'irish','boring',6.2),
 (4,'Ice song','Fantacy',8.6),(5,'House card','Interesting',9.1);

-- 在下面写你的查询：

