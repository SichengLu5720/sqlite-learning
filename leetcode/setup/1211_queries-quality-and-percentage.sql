-- 1211. 查询结果的质量和占比
-- https://leetcode.cn/problems/queries-quality-and-percentage/
-- 分组：3 聚合函数
-- 用法：sqlite3 sql50.db 后执行  .read setup/1211_queries-quality-and-percentage.sql

DROP TABLE IF EXISTS Queries;
CREATE TABLE Queries (query_name TEXT, result TEXT, position INTEGER, rating INTEGER);
INSERT INTO Queries VALUES ('Dog','Golden Retriever',1,5),('Dog','German Shepherd',2,5),('Dog','Mule',200,1),
 ('Cat','Shirazi',5,2),('Cat','Siamese',3,3),('Cat','Sphynx',7,4);

-- 在下面写你的查询：

