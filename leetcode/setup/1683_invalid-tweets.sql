-- 1683. 无效的推文
-- https://leetcode.cn/problems/invalid-tweets/
-- 分组：1 查询
-- 用法：sqlite3 sql50.db 后执行  .read setup/1683_invalid-tweets.sql

DROP TABLE IF EXISTS Tweets;
CREATE TABLE Tweets (tweet_id INTEGER PRIMARY KEY, content TEXT);
INSERT INTO Tweets VALUES (1,'Let us Code'),(2,'More than fifteen chars are here!');

-- 在下面写你的查询：

