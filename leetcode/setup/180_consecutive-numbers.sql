-- 180. 连续出现的数字
-- https://leetcode.cn/problems/consecutive-numbers/
-- 分组：5 高级查询和连接
-- 用法：sqlite3 sql50.db 后执行  .read setup/180_consecutive-numbers.sql

DROP TABLE IF EXISTS Logs;
CREATE TABLE Logs (id INTEGER PRIMARY KEY, num TEXT);
INSERT INTO Logs VALUES (1,'1'),(2,'1'),(3,'1'),(4,'2'),(5,'1'),(6,'2'),(7,'2');

-- 在下面写你的查询：

