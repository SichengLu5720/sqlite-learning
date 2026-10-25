-- 595. 大的国家
-- https://leetcode.cn/problems/big-countries/
-- 分组：1 查询
-- 用法：sqlite3 sql50.db 后执行  .read setup/595_big-countries.sql

DROP TABLE IF EXISTS World;
CREATE TABLE World (name TEXT PRIMARY KEY, continent TEXT, area INTEGER, population INTEGER, gdp INTEGER);
INSERT INTO World VALUES
 ('Afghanistan','Asia',652230,25500100,20343000000),
 ('Albania','Europe',28748,2831741,12960000000),
 ('Algeria','Africa',2381741,37100000,188681000000),
 ('Andorra','Europe',468,78115,3712000000),
 ('Angola','Africa',1246700,20609294,100990000000);

-- 在下面写你的查询：

