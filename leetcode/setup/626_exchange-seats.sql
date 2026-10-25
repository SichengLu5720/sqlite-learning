-- 626. 换座位
-- https://leetcode.cn/problems/exchange-seats/
-- 分组：6 子查询
-- 用法：sqlite3 sql50.db 后执行  .read setup/626_exchange-seats.sql

DROP TABLE IF EXISTS Seat;
CREATE TABLE Seat (id INTEGER PRIMARY KEY, student TEXT);
INSERT INTO Seat VALUES (1,'Abbot'),(2,'Doris'),(3,'Emerson'),(4,'Green'),(5,'Jeames');

-- 在下面写你的查询：

